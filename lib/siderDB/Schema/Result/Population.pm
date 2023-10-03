use utf8;
package siderDB::Schema::Result::Population;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

siderDB::Schema::Result::Population

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<population>

=cut

__PACKAGE__->table("population");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'population_id_seq'

=head2 super_population_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

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
    sequence          => "population_id_seq",
  },
  "super_population_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
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

=head2 super_population

Type: belongs_to

Related object: L<siderDB::Schema::Result::SuperPopulation>

=cut

__PACKAGE__->belongs_to(
  "super_population",
  "siderDB::Schema::Result::SuperPopulation",
  { id => "super_population_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-10-03 20:39:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DI29CkL2zynSV4PEn8VAMg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
