use strict;
use warnings;
use Test::More;

use Catalyst::Test 'siderDB';
use siderDB::Controller::Search;

ok(request('/search/population')->is_success, 'Request should succeed');
ok(request('/search/super_population')->is_success, 'Request should succeed');

done_testing();
