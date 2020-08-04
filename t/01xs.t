use Test2::V0 -no_srand => 1;
use Test::Alien::CPP;
use Test::Alien::Diag;
use Alien::Boost;
 
alien_diag 'Alien::Boost';
 
alien_ok 'Alien::Boost';
 
subtest xs => sub {
 
  my $xs = <<'EOM';
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <boost/program_options.hpp>

 
MODULE = Boost PACKAGE = Boost
 
int 
mytest()
    INIT:
    CODE:
      boost::program_options::options_description generic("Generic options");
      RETVAL = 0;
    OUTPUT:
      RETVAL
EOM
 
  xs_ok $xs, with_subtest {
    ok(Boost::mytest());
  };
 
};
 
done_testing;
