use strict;
use warnings;
use Test::More;

use Catalyst::Test 'siderDB';
use siderDB::Controller::View;

ok( request('/view/population/esp')->is_success, 'Request should succeed' );
ok( request('/view/super_population/brz')->is_success, 'Request should succeed' );

done_testing();
