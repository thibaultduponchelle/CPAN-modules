#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Acme::CaSe' ) || print "Bail out!\n";
}

diag( "Testing Acme::CaSe $Acme::CaSe::VERSION, Perl $], $^X" );
