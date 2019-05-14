#!/usr/bin/env perl
use warnings;
use strict;

package main;

use Carp;

use version; our $VERSION = qv( qw$Revision 0.0.1$[1] );

use Getopt::Long qw(:config no_ignore_case); # Option parser. Exports GetOptions()
use Pod::Usage; # for --help parameter. Exports pod2usage(), which exit()s
# use IO::Prompt; # for command input. Exports prompt()


use FindBin;
# use lib $FindBin::Bin."/lib";     ## Uncomment if script uses lib directory below script directory


sub parse_options {
    local @ARGV = @_ if @_;    
    my ($help, $version, $man);
    my %opts = (help => \$help, version => \$version, man => \$man);
         
    GetOptions(\%opts,
        'help|?', 'version', 'man', # help
    ) or pod2usage(2);
    
    # Check for and exit with help
    if ($help) {
        pod2usage(1);
    }
    if ($version) {
         print "$0 version $VERSION\n"; exit 0;
    }
    if ($man) {
        pod2usage( -exitstatus => 1, -verbose => 1)
    }
    
    # Process/Check other parameters
    
    # Add remaining CMD arguments
    $opts{_args} = [@ARGV];
    
    return \%opts;
}

sub main {
    local @ARGV = @_ if @_;
    my $opts = parse_options(@ARGV);
}

if (!caller) { # only if called as a script
    main(@ARGV);
}

1;
__END__

=head1 NAME

<SCRIPT NAME> - [One line description of SCRIPT's purpose here]


=head1 VERSION

This document describes <SCRIPT NAME> version 0.0.1


=head1 SYNOPSIS

    <SCRIPT NAME> options...;

=for author to fill in:
    Brief code example(s) here showing commonest usage(s).
    This section will be as far as many users bother reading
    so make it as educational and exeplary as possible.
  
=head1 OPTIONS

=for author to fill in:
    A complete list of every available option with which the application
    can be invoked, explaining what each does, and listing any restrictions
    or interactions.
    
    If the application has no options, this section may be omitted entirely

=head1 REQUIRED ARGUMENTS

=for author to fill in:
    A complete list of every argument that must appear on the command line
    when the application is invoked, explaining what each of them does, any
    restriction on where each one may appear (i.e. flags that must appear
    before or after filenames), and how the various arguments and options
    may interact (e.g. mutual exclusions, required combinations, etc.)
    
    If all of the application's arguments are optional, this section 
    may be omitted entirely.
      
=head1 DESCRIPTION

=for author to fill in:
    Write a full description of the SCRIPT and its features here.
    Use subsections (=head2, =head3) as appropriate.


=head1 DIAGNOSTICS

=for author to fill in:
    List every single error and warning message that the SCRIPT can
    generate (even the ones that will "never happen"), with a full
    explanation of each problem, one or more likely causes, and any
    suggested remedies.

=over

=item C<< Error message here, perhaps with %s placeholders >>

[Description of error here]

=item C<< Another error message here >>

[Description of error here]

[Et cetera, et cetera]

=back


=head1 CONFIGURATION AND ENVIRONMENT

=for author to fill in:
    A full explanation of any configuration system(s) used by the
    SCRIPT, including the names and locations of any configuration
    files, and the meaning of any environment variables or properties
    that can be set. These descriptions must also include details of any
    configuration language used.
  
<SCRIPT NAME> requires no configuration files or environment variables.


=head1 DEPENDENCIES

=for author to fill in:
    A list of all the other SCRIPTs that this SCRIPT relies upon,
    including any restrictions on versions, and an indication whether
    the SCRIPT is part of the standard Perl distribution, part of the
    SCRIPT's distribution, or must be installed separately. ]

None.


=head1 INCOMPATIBILITIES

=for author to fill in:
    A list of any SCRIPTs that this SCRIPT cannot be used in conjunction
    with. This may be due to name conflicts in the interface, or
    competition for system or program resources, or due to internal
    limitations of Perl (for example, many SCRIPTs that use source code
    filters are mutually incompatible).

None reported.


=head1 BUGS AND LIMITATIONS

=for author to fill in:
    A list of known problems with the SCRIPT, together with some
    indication Whether they are likely to be fixed in an upcoming
    release. Also a list of restrictions on the features the SCRIPT
    does provide: data types that cannot be handled, performance issues
    and the circumstances in which they may arise, practical
    limitations on the size of data sets, special cases that are not
    (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-<RT NAME>@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=for author to add or remove:
    The sections EXAMPLES, FREQUENTLY ASKED QUESTIONS, COMMON USAGE MISTAKES,
    SEE ALSO, and ACKNOWLEDGEMENTS can be added or removed as needed

=head1 EXAMPLES

=for author to fill in:
    Add illustrative examples of specific use cases or methods that
    may be I<tricky> or are particularly common and thus should be 
    expanded on from the synopsis or description.

=head1 FREQUENTLY ASKED QUESTIONS

=for author to fill in:
    Add common questions and the standard answers here.

=head1 COMMON USAGE MISTAKES

=for author to fill in:
    If there are common mistakes made when using the code (often discovered 
    through apparently unrelated questions), explain the misconceptions and
    provide examples of correct usage.

=head1 SEE ALSO

=for author to fill in:
    Add references to SCRIPTs, documentation, or other information that
    will make it simpler for users to understand what this code is for
    and how it works.



=head1 AUTHOR

Alexander Richter  C<< <rrichter@jcvi.org> >>

=head1 ACKNOWLEDGEMENTS

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2006, Alexander Richter C<< <rrichter@jcvi.org> >>. All rights reserved.

This SCRIPT is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
