#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Acme::Version::utf8' ) || print "Bail out!\n";
}

diag( "Testing Acme::Version::utf8 $Acme::Version::utf8::VERSION, Perl $], $^X" );
