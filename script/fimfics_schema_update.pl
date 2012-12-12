#!/usr/bin/env perl

use FindBin '$Bin';
use File::Temp 'tempfile';
use DBI;
use SQL::Script;
my(undef, $tmp) = tempfile;

my $dbh = DBI->connect("dbi:SQLite:$tmp");
my $sql = SQL::Script->new;
$sql->read("$Bin/../schema.sql");
$sql->run( $dbh );

my @args = (
	"$Bin/fimfics_create.pl",
	'model',
	'DB',
	'DBIC::Schema',
	'Fimfics::Schema',
	'create=static',
	'components=TimeStamp',
	"dbi:SQLite:$tmp",
	'sqlite_unicode=1',
);

system(@args) == 0
	or die "system @args failed: $?";

unlink $tmp;
