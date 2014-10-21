package Mojolicious::Plugin::TtRenderer;

use strict;
use warnings;
use v5.10;

# ABSTRACT: Template Renderer Plugin
our $VERSION = '1.47'; # VERSION

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

=pod

=head1 NAME

Mojolicious::Plugin::TtRenderer - Template Renderer Plugin

=head1 VERSION

version 1.47

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

=encoding utf-8

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

=cut

=head1 AUTHOR

original author: Ask Bjørn Hansen

current maintainer: Graham Ollis <plicease@cpan.org>

contributors:

vti

Marcus Ramberg

Matthias Bethke

Htbaa

Magnus Holm

Maxim Vuets

Rafael Kitover

giftnuss

Cosimo Streppone

Fayland Lam

Jason Crowther

spleenjack

Árpád Szász

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Ask Bjørn Hansen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
