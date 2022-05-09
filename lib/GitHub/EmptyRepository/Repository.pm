package GitHub::EmptyRepository::Repository;

use Moo;

our $VERSION = '0.00001';

use GitHub::EmptyRepository::Repository::Commit ();
use MooX::StrictConstructor;
use Types::Standard qw( HashRef ArrayRef Bool InstanceOf Str );
use URI ();

has github_client => (
    is       => 'ro',
    isa      => InstanceOf ['Pithub::Repos::Commits'],
    required => 1,
);

has name => (
    is       => 'ro',
    isa      => Str,
    init_arg => undef,
    lazy     => 1,
    default  => sub {
        my $self = shift;
        my ( undef, $name ) = $self->_parse_github_url( $self->url );
        return $name;
    },
);

has report => (
    is       => 'ro',
    isa      => HashRef,
    init_arg => undef,
    lazy     => 1,
    builder  => '_build_report',
);

has url => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has user => (
    is       => 'ro',
    isa      => Str,
    init_arg => undef,
    lazy     => 1,
    default  => sub {
        my $self = shift;
        my ($user) = $self->_parse_github_url( $self->url );
        return $user;
    },
);

sub _build_report {
    my $self = shift;

    my $commits = $self->_get_commits;

    my $total = $commits ? scalar @{$commits} : 0;

    my %summary = ( nb_commits => $total );
    $summary{files} = [];

    foreach my $commit ( @{$commits} ) {
        foreach my $file ( @{ $commit->files } ) {
            push @{ $summary{files} }, $file;
        }
    }

    return \%summary;
}

## no critic (ValuesAndExpressions::ProhibitAccessOfPrivateData)
sub _get_commits {
    my $self = shift;

    my $result = $self->github_client->list(
        user   => $self->user,
        repo   => $self->name,
        params => { per_page => 2, state => 'all' },
    );

    $result->auto_pagination(0);

    my @commits;

    return \@commits unless $result->response->is_success;

    while ( my $row = $result->next ) {
        my $commit = GitHub::EmptyRepository::Repository::Commit->new(
            github_client => $self->github_client,
            repo          => $self->name,
            user          => $self->user,
            sha           => $row->{sha}
        );

        push @commits, $commit;
    }
    return \@commits;
}
## use critic

sub _parse_github_url {
    my $self = shift;
    my $uri  = URI->new(shift);

    my @parts = split m{/}, $uri->path;

    # paths may or may not have a leading slash (absolute vs relative)
    my $user = shift @parts || shift @parts;
    my $name = shift @parts;
    $name =~ s{\.git}{};

    return ( $user, $name );
}

1;

__END__

# ABSTRACT: Encapsulate repository data for a repository

=pod

=cut
