#!/usr/bin/env perl

use FindBin '$Bin';
use lib "$Bin/../lib";
use DBI;
use DateTime;
use SQL::Script;
use Fimfics::Schema;

my $fn = "$Bin/../Fimfics.db";
unlink $fn if -e $fn;
my $dbh = DBI->connect("dbi:SQLite:$fn");

my $sql = SQL::Script->new;
$sql->read("$Bin/../schema.sql");
$sql->run($dbh);

if( my $datafile = shift ) {
	my %users;
	my %storys;
	my @favs;

	open R, "<", $datafile;
	while( <R> ) {
		if( /^\( (.+) \)/x ) {
			my($user, $story, $email, $date, $deleted) = split ", ", $1;
			next if $deleted;

			$users{$user} = 1;
			$storys{$story} = 1;
			push @favs, {
				user_id  => $user, 
				story_id => $story, 
				created => $date ? DateTime->from_epoch( epoch => $date ) : undef,
			};
		}
	}

	my $schema = Fimfics::Schema->connect("dbi:SQLite:$fn");

	$schema->resultset('User')->populate([ map { {id => $_} } keys %users ]);
	$schema->resultset('Story')->populate([ map { {id => $_} } keys %storys ]);
	$schema->resultset('Fav')->populate(\@favs);
}