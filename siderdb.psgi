use strict;
use warnings;

use siderDB;

my $app = siderDB->apply_default_middlewares(siderDB->psgi_app);
$app;

