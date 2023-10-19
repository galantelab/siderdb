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

=head2 code

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 description

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "code",
  { data_type => "char", is_nullable => 0, size => 3 },
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

=head2 populations

Type: has_many

Related object: L<siderDB::Schema::Result::Population>

=cut

__PACKAGE__->has_many(
  "populations",
  "siderDB::Schema::Result::Population",
  { "foreign.super_population_code" => "self.code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-10-19 04:13:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/Ql3YdBZq8KYE3V8+6XfIg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
