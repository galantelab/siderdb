package siderDB::Controller::Search;

use Moose;
use namespace::autoclean;

with qw/siderDB::Role::Search/;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

siderDB::Controller::Search - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller. Manage /search/ pages

=head1 METHODS

=cut

=head2 query

Get the key searched by the user and look for
it according to the table (type)

=cut

sub query :Path('/search') :Args(1) {
    my ($self, $c, $type) = @_;

    # Catch GET params only
    my $key = $c->req->query_params->{key};

    # Search for the key
    $self->with_search($c, $type, $key);

    # If searching failed, stash.search does not exist
    unless (exists $c->stash->{search}) {
        $c->response->body("Page not found: $type");
        $c->response->status(404);
        $c->detach;
    }

    # Set page title
    $c->stash->{title} = 'Search '
        . $c->stash->{search}->{title};
}

=encoding utf8

=head1 AUTHOR

Thiago Miller

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
