package siderDB::View::Web;

use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

siderDB::View::Web - TT View for siderDB

=head1 DESCRIPTION

TT View for siderDB.

=head1 SEE ALSO

L<siderDB>

=head1 AUTHOR

Thiago Miller

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
