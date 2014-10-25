#!perl
#===============================================================================
#
# t/01_imports_01.t
#
# DESCRIPTION
#   Test script to check import options.
#
# COPYRIGHT
#   Copyright (C) 2004-2006, 2014 Steve Hay.  All rights reserved.
#
# LICENCE
#   You may distribute under the terms of either the GNU General Public License
#   or the Artistic License, as specified in the LICENCE file.
#
#===============================================================================

use 5.008001;

use strict;
use warnings;

use Cwd qw(abs_path);
use File::Spec::Functions qw(canonpath catdir catfile updir);
use FindBin qw($Bin);
use Test::More;

#===============================================================================
# INITIALIZATION
#===============================================================================

BEGIN {
    my $top_dir = canonpath(abs_path(catdir($Bin, updir())));
    my $lib_dir = catfile($top_dir, 'blib', 'lib', 'Filter', 'Crypto');

    if (-f catfile($lib_dir, 'CryptFile.pm')) {
        plan tests => 7;
        require_ok('Filter::Crypto::CryptFile');
    }
    else {
        plan skip_all => 'CryptFile component not built';
    }
}

#===============================================================================
# MAIN PROGRAM
#===============================================================================

MAIN: {
    ok(!defined &main::crypt_file, 'crypt_file is not imported');
    ok(!eval { CRYPT_MODE_AUTO(); 1 }, 'CRYPT_MODE_AUTO is not imported');
    ok(!eval { CRYPT_MODE_DECRYPT(); 1 }, 'CRYPT_MODE_DECRYPT is not imported');
    ok(!eval { CRYPT_MODE_ENCRYPT(); 1 }, 'CRYPT_MODE_ENCRYPT is not imported');
    ok(!eval { CRYPT_MODE_DECRYPTED(); 1 }, 'CRYPT_MODE_DECRYPTED is not imported');
    ok(!eval { CRYPT_MODE_ENCRYPTED(); 1 }, 'CRYPT_MODE_ENCRYPTED is not imported');
}

#===============================================================================
