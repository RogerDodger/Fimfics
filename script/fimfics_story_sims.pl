#!/usr/bin/env perl

use FindBin '$Bin';
use lib "$Bin/../lib";
use Fimfics::Schema;

my $dbi = Fimfics::Schema->connect("dbi:SQLite:$Bin/../Fimfics.db");
my $rs = $dbi->resultset("StorySim");
$rs->recalculate;