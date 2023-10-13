use strict;
use warnings;

use Test::More;
use Test::DBIx::Class;

fixtures_ok 'basic'
	=> 'installed the basic fixtures from configuration file';

ok my $sp = SuperPopulation->find({code => 'BRZ'}), 'found super_population';

ok my $p = Population->find({code => 'ESP'}), 'found population';

is_fields $sp, {
	code        => 'BRZ',
	description => 'Brazilians',
	timestamp   => 20231224
}, 'BRZ has the expected fields';

is_fields $p, {
	super_population_id => 1,
	code        => 'ESP',
	description => 'Elderly Brazilians living in Sao Paulo',
	timestamp   => 20231224
}, 'ESP has the expected fields';

done_testing;
