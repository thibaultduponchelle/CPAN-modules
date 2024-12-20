#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( '_Acme::Local' ) || print "Bail out!\n";
}

diag( "Testing _Acme::Local $_Acme::Local::VERSION, Perl $], $^X" );
