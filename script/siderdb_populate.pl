#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

use Config::Any;
use List::Util qw/pairs/;
use FindBin qw/$Bin/;

use lib "$Bin/../lib";

use siderDB::Schema;

if (scalar(@ARGV) < 4) {
    die "Usage: $0 <FIXTURES_FILE> <URI> <USER> <PASSWORD>\n";
}

my ($fixture_file, $dbi, $user, $password) = @ARGV;

my $schema = siderDB::Schema->connect($dbi, $user, $password);

$schema->storage->throw_exception
    unless $schema->storage->ensure_connected;

die "No such file '$fixture_file'\n"
    unless -f $fixture_file;

my $config_any = Config::Any->load_files(
    {
        files   => [$fixture_file],
        use_ext => 1
    }
);

my $config = $config_any->[0]->{$fixture_file};
my $fixture_tuples = $config->{fixture_sets}->{basic};

warn "==> Populate database with fixtures from '$fixture_file'\n";

for my $fixture_tuple (pairs @$fixture_tuples) {
    my ($table, $fixture) = @$fixture_tuple;

    warn " -> Populate table '$table'\n";

    $schema->resultset($table)->delete_all;
    $schema->resultset($table)->populate($fixture);
}
