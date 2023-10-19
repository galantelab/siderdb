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

=head2 code

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 super_population_code

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 3

=head2 description

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "char", is_nullable => 0, size => 3 },
  "super_population_code",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 3 },
  "description",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->set_primary_key("code");

=head1 RELATIONS

=head2 super_population_code

Type: belongs_to

Related object: L<siderDB::Schema::Result::SuperPopulation>

=cut

__PACKAGE__->belongs_to(
  "super_population_code",
  "siderDB::Schema::Result::SuperPopulation",
  { code => "super_population_code" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-10-19 04:13:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7qCqzBjWuZV3bYbxwAZLwg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
