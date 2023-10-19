package siderDB::Controller::Search;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

siderDB::Controller::Search - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller. Manage /search/ pages

=head1 METHODS

=cut

=head2 base

Validate and initialize /search/*/ pages

=cut

sub base :Chained('/') :PathPart('search') :CaptureArgs(1) {
    my ($self, $c, $type) = @_;

    # Get the hashref resultsets initialized
    # into Root controller
    my $resultsets = $c->stash->{resultsets};

    if (exists $resultsets->{$type}) {
        # If there is search for type, set the entry
        # carch in order to be used in the tenplate
        $c->stash(
            title  => "Search $type",
            search => {type => $type}
        );
    } else {
        #die "There is no search for '$rs_type'";
        $c->response->body("Page not found: $type");
        $c->response->status(404);
        $c->detach;
    }
}

=head2 query

End of the chained /search/*/. Query the key according
to the search.type

=cut

sub query :Chained('base') :PathPart('') :Args(0) {
    my ($self, $c) = @_;

    # Catch GET params only
    my $key = $c->req->query_params->{key};

    if ($key) {
        my $search = $c->stash->{search};
        my $type = $search->{type};
        my $rs = $c->stash->{resultsets}->{$type};

        # TODO: Searching for "code" works for Population
        # and SuperPopulaton. I need to make switch
        # when working with the other tables
        my $result = $rs->find(
            {code  => $key}
        );

        @$search{qw/key result/} = ($key, $result);
    }
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
