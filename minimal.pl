#!/usr/bin/env perl
use strict;
use warnings;

use Getopt::Long;
sub parse_args{
    local @ARGV=@_ if @_;
    my $opts_hr = {};
    GetOptions($opts_hr,
        'help|h',
        'verbose|v',
    );
    return $opts_hr;
}
sub main{
    local @ARGV = @_ if @_;
    my $opts_hr = parse_args(@ARGV);
    push @ARGV,'-' if not @ARGV; # by default, read from stdin
    foreach my $f (@ARGV) {
        my $fh;
        if ($f eq '-') {
            $fh = \*STDIN;
        }
        else {
            open $fh, '<', $f;
        }
        # do stuff with the file
    }

}

main() if not caller();
