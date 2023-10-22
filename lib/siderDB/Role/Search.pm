package siderDB::Role::Search;

use Moose::Role;
use siderDB::Types;

=head1 NAME

siderDB::Role::Search - Moose Role

=head1 DESCRIPTION

Role to handle database searching

=cut

=head1 ATTRIBUTES

=cut

=head2 _search_tables

Moose trait which allocates a hash with
standardized searches

=cut

has _search_tables => (
    traits     => ['Hash'],
    is         => 'ro',
    isa        => 'HashRef[My:SearchTable]',
    lazy_build => 1,
    builder    => '_build_search_tables',
    handles    => {
        get_search_table    => 'get',
        exists_search_table => 'exists'
    }
);

=head1 METHODS

=cut

=head2 _build_search_tables

_search_tables builder

=cut

sub _build_search_tables {
    {
        super_population => {
            title => 'Super population',
            model => 'Schema::SuperPopulation',
            find  => sub {
                $_[0]->model('Schema::SuperPopulation')
                    ->find({code => $_[1]})
            }
        },
        population => {
            title => 'Population',
            model => 'Schema::Population',
            find  => sub {
                $_[0]->model('Schema::Population')
                    ->find({code => $_[1]})
            }
        }
    };
}

=head2 with_search

Search into database according with the table.
Set the stash with the hash search

=cut

sub with_search {
    my ($self, $c, $type, $key) = @_;

    unless ($self->exists_search_table($type)) {
        return;
    }

    my $st = $self->get_search_table($type);

    $c->stash->{search} = {
        title  => $st->{title},
        type   => $type,
        key    => $key,
        result => undef
    };

    if (defined $key) {
        $c->stash->{search}->{result} = $st->{find}->($c, $key);
    }
}

=encoding utf8

=head1 AUTHOR

Thiago Miller

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

no Moose::Role;

1;
