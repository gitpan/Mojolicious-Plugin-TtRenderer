package Mojolicious::Plugin::TtRenderer;
{
  $Mojolicious::Plugin::TtRenderer::VERSION = '1.43_01';
}

use strict;
use warnings;
use v5.10;

use base 'Mojolicious::Plugin';

use Mojolicious::Plugin::TtRenderer::Engine;

sub register {
    my ($self, $app, $args) = @_;

    $args ||= {};

    my $tt = Mojolicious::Plugin::TtRenderer::Engine->build(%$args, app => $app);

    # Add "tt" handler
    $app->renderer->add_handler(tt => $tt);
}

$Mojolicious::Plugin::TtRenderer::VERSION //= ('devel');

1;
__END__

=encoding utf-8

=head1 NAME

Mojolicious::Plugin::TtRenderer - Template Renderer Plugin

=head1 SYNOPSIS

 # Mojolicious
 $self->plugin('tt_renderer');
 $self->plugin(tt_renderer => {template_options => {FILTERS => [ ... ]}});

 # Mojolicious::Lite
 plugin 'tt_renderer';
 plugin tt_renderer => {template_options => {FILTERS => [ ... ]}};

=head1 DESCRIPTION

L<Mojolicious::Plugin::TtRenderer> is a simple loader for 
L<Mojolicious::Plugin::TtRenderer::Engine>.

=head1 METHODS

L<Mojolicious::Plugin::TtRenderer> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 C<register>

 $plugin->register;

Register renderer in L<Mojolicious> application.

=head1 EXTRA STASH VARIABLES

The current controller instance can be accessed as C<c>.

 [% c.req.headers.host %]

=head1 SEE ALSO

L<Mojolicious::Plugin::TtRenderer::Engine>, 
L<Mojolicious>, 
L<Mojolicious::Guides>, 
L<http://mojolicious.org>.

=head1 AUTHOR

Current maintainer: Graham Ollis C<< <plicease@cpan.org> >>

Original author: Ask Bjørn Hansen, C<< <ask at develooper.com> >>

=head1 BUGS

Please report any bugs or feature requests to the project's github issue tracker
L<https://github.com/abh/mojox-renderer-tt/issues?state=open>.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

 perldoc Mojolicious::Plugin::TtRenderer

You can also look for information at:

=over 4

=item * git repository

L<http://git.develooper.com/?p=MojoX-Renderer-TT.git;a=summary>,
L<git://git.develooper.com/MojoX-Renderer-TT.git>

L<http://github.com/abh/mojox-renderer-tt/>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MojoX-Renderer-TT>

=item * Search CPAN

L<http://search.cpan.org/dist/MojoX-Renderer-TT/>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008-2010 Ask Bjørn Hansen, all rights reserved.

Copyright 2012 Graham Ollis.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
