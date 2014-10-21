use strict;
use warnings;
use File::Temp qw( tempdir );
BEGIN { $ENV{MOJO_HOME} = tempdir( CLEANUP => 1) }
use Test::More tests => 6;
use Test::Mojo;

use Mojolicious::Lite;
plugin 'tt_renderer';
app->renderer->default_handler('tt');

get '/' => sub {
    die 'foo';
};

get '/bar' => 'bar';

my $t = Test::Mojo->new;

$t->get_ok('/')
    ->status_is(500)
    ->content_like(qr{foo});

$t->get_ok('/bar')
    ->status_is(200)
    ->content_like(qr{bar});

#note $t->tx->res->to_string;

__DATA__

@@ index.html.tt
anything

@@ bar.html.tt
sometimes, the bar, he eats you...

