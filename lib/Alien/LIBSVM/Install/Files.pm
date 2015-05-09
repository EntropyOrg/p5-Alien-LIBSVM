package Alien::LIBSVM::Install::Files;

# allows other packages to use ExtUtils::Depends like so:
#   use ExtUtils::Depends;
#   my $p = new ExtUtils::Depends MyMod, Alien::LIBSVM;
# and their code will have all LIBSVM available at C level

use strict;
use warnings;

use Alien::LIBSVM qw(Inline);
BEGIN { *Inline = *Alien::LIBSVM::Inline }
sub deps { () }
