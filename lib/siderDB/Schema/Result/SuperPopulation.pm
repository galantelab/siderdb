use utf8;
package siderDB::Schema::Result::SuperPopulation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

siderDB::Schema::Result::SuperPopulation

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<super_population>

=cut

__PACKAGE__->table("super_population");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'super_population_id_seq'

=head2 code

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 timestamp

  data_type: 'timestamp with time zone'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "super_population_id_seq",
  },
  "code",
  { data_type => "char", is_nullable => 0, size => 3 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "timestamp",
  {
    data_type     => "timestamp with time zone",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 populations

Type: has_many

Related object: L<siderDB::Schema::Result::Population>

=cut

__PACKAGE__->has_many(
  "populations",
  "siderDB::Schema::Result::Population",
  { "foreign.super_population_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-10-03 20:39:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZZcXZjaAMIjsmJqM0Ettjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
