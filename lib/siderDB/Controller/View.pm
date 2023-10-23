package siderDB::Controller::View;

use Moose;
use namespace::autoclean;

with qw/siderDB::Role::Search/;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

siderDB::Controller::View - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller. Manage /view/ pages

=head1 METHODS

=cut

=head2 profile

Show the main profile information about the key
according to the search.type

=cut

sub profile :Path('/view') :Args(2) {
    my ($self, $c, $type, $key) = @_;

    # Let's search
    $self->with_search($c, $type, $key);

    # Our hero
    my $search = $c->stash->{search};

    # If there is no type (table) or there is no result
    # for the type
    unless (defined $search && defined $search->{result}) {
        $c->response->body("Page not found: $type => $key");
        $c->response->status(404);
        $c->detach;
    }

    # Set page title
    $c->stash->{title} = 'View '
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
