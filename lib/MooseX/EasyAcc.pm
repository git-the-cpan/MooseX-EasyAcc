#
# This file is part of MooseX-EasyAcc
#
# This software is Copyright (c) 2011 by Edward J. Allen III.
#
# This is free software, licensed under:
#
#   The Artistic License 2.0 (GPL Compatible)
#
use strict; use warnings;
package MooseX::EasyAcc;
BEGIN {
  $MooseX::EasyAcc::VERSION = '0.001';
}
BEGIN {
  $MooseX::EasyAcc::AUTHORITY = 'cpan:EALLENIII';
}

#ABSTRACT: Name your accessors foo(), set_foo(), and has_foo()
use Moose 1.9900;
use Moose::Exporter;

Moose::Exporter->setup_import_methods(
    class_metaroles => {
        attribute => ['MooseX::EasyAcc::Role::Attribute'],

    },
    role_metaroles =>
        { applied_attribute => ['MooseX::EasyAcc::Role::Attribute'], },

);

1;    # Magic true value required at end of module


=pod

=for :stopwords Edward Allen J. III cpan testmatrix url annocpan anno bugtracker rt cpants
kwalitee diff irc mailto metadata placeholders Rolsky Rolsky's
SemiAffordance attr ro

=encoding utf-8

=head1 NAME

MooseX::EasyAcc - Name your accessors foo(), set_foo(), and has_foo()

=head1 VERSION

  This document describes v0.001 of MooseX::EasyAcc - released June 13, 2011 as part of MooseX-EasyAcc.

=head1 SYNOPSIS

    package MyApp;
    use Moose;
    use MooseX::EasyAcc;

    has 'name' => (
        is => 'rw',
        isa => 'Str'
    );
    # This creates methods: name, set_name, has_name

    has 'supernumber' => (
        is => 'ro',
        isa => 'Int',
    );
    # This creates methods: supernumber, _set_supernumber, has_supernumber

    has '_superhero_name' => (
        is => 'ro',
        isa => 'Str'
    );
    # This creates methods: _superhero_name, _set__superhero_name, _has__superhero_name

    has 'superpower' => (
        is => 'ro',
        isa => 'Str',
        predicate => 'is_awesome',
    );
    # This creates methods: superpower, _set_supernumber, is_awesome
   
    has 'nemisis' => (
        is => 'rw',
        isa => 'MyApp',
        predicate => 'is_loved',
        reader => 'best_friend',
    );
    # This creates methods: best_friend , set_nemisis, is_loved
    # and so on....

=head1 DESCRIPTION

Like L<MooseX::FollowPBP>, or L<MooseX::SemiAffordanceAccessor> this changes the naming convention for accessors.

Attributes are created using L<SemiAffordance|MooseX::SemiAffordanceAccessor>
style (attr, set_attr) with the addition of a predicate (prefixed with 'has_').  Unlike
L<MooseX::SemiAffordanceAccessor>, setting 'ro' does not prevent the creation
of a writer, only makes it private (by prepending a '_').  Also, explicitly
setting an accessor only overwrites this accessor, doesn't cancel the whole
scheme.

In the case of an attribute starting with underscore, '_set_' and '_has_'
prefix is used.

=head1 NOTE ON USAGE IN ROLES

Applying this module to a class will not affect the default attribute traits
of roles assigned to the class.

Applying this module to a role will affect all attributes in that role, but
not classes that it is applied to.

=head1 ACKNOWLEDGMENTS

Much of this is based on reviewing Dave Rolsky's MooseX::FollowPBP, 
Copyright (c) 2011 by Dave Rolsky and is available wherever fine
Perl modules are distributed.

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Moose|Moose>

=item *

L<MooseX::FollowPBP|MooseX::FollowPBP>

=item *

L<MooseX::SemiAffordanceAccessor|MooseX::SemiAffordanceAccessor>

=back

=head1 SUPPORT

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

The default CPAN search engine, useful to view POD in HTML format.

L<http://search.cpan.org/dist/MooseX-EasyAcc>

=item *

CPAN Testers Dependencies

The CPAN Testers Dependencies is a website that shows a chart of the test results of all dependencies for a distribution.

L<http://deps.cpantesters.org/?module=MooseX::EasyAcc>

=item *

CPANTS

The CPANTS is a website that analyzes the Kwalitee ( code metrics ) of a distribution.

L<http://cpants.perl.org/dist/overview/MooseX-EasyAcc>

=item *

CPAN Testers

The CPAN Testers is a network of smokers who run automated tests on uploaded CPAN distributions.

L<http://www.cpantesters.org/distro/M/MooseX-EasyAcc>

=item *

CPAN Testers Matrix

The CPAN Testers Matrix is a website that provides a visual way to determine what Perls/platforms PASSed for a distribution.

L<http://matrix.cpantesters.org/?dist=MooseX-EasyAcc>

=back

=head2 Email

You can email the author of this module at C<EALLENIII at cpan.org> asking for help with any problems you have.

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-moosex-easyacc at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-EasyAcc>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<http://github.com/riemann42/moosex-easyacc>

  git clone git://github.com/riemann42/moosex-easyacc.git

=head1 AUTHOR

Edward Allen <ealleniii@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by Edward J. Allen III.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT
WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER
PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME
THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE LIABLE
TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.

=cut


__END__


