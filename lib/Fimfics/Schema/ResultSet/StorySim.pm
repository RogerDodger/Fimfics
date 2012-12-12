package Fimfics::Schema::ResultSet::StorySim;

use strict;
use base 'DBIx::Class::ResultSet';

sub recalculate {
	my $self = shift;
	my $chop = shift // 50;
	my $schema = $self->result_source->schema;

	my $ratings = $schema->resultset('Rating');
	my $storys = $schema->resultset('Story');

	# Delete old calculations
	$self->delete;

	my $n = $storys->count;
	my $total_passes = $n * ($n + 1) / 2;
	my $pass_counter = 1;
	my $start_time = time;
	my $i = 1;

	while(my $story1 = $storys->next) {

		# Slice second set so that items are not matched twice
		my $storys2 = $schema->resultset('Story')->slice($i, $n - 1);
		my @rels;

		while(my $story2 = $storys2->next) {

			push @rels, { 
				story1_id  => $story1->id,
				story2_id  => $story2->id,
				similarity => $ratings->sim_pearson($story1, $story2),
			};

			# Status updates
			if( $pass_counter % 100 == 0 ) {
				printf "Status %d / %d (%ds runtime)\n", 
					$pass_counter, 
					$total_passes,
					time - $start_time;
			}
			$pass_counter++;
		}

		print "Writing...\n";
		@rels = sort { $b->{similarity} <=> $a->{similarity} } @rels;
		$self->populate([ @rels[0..$chop] ]);

		$i++;
	}
}

1;