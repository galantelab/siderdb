use strict;
use warnings;

use Test::More;
use Test::DBIx::Class;

fixtures_ok 'basic'
	=> 'installed the basic fixtures from configuration file';

ok my $sp = SuperPopulation->find({code => 'BRZ'}), 'found super_population';

ok my $p = Population->find({code => 'ESP'}), 'found population';

is_fields $sp, {
	description => 'Brazilians'
}, 'BRZ has the expected fields';

is_fields $p, {
	super_population_code => $sp,
	description => 'Elderly Brazilians living in Sao Paulo'
}, 'ESP has the expected fields';

done_testing;
