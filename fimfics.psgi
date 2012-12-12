use strict;
use warnings;

use Fimfics;

my $app = Fimfics->apply_default_middlewares(Fimfics->psgi_app);
$app;

