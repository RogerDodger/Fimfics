package Fimfics::Schema::ResultSet::Rating;

use strict;
use base 'DBIx::Class::ResultSet';
use Carp 'croak';

=head1 NAME 

Fimfics::Schema::ResultSet::Rating - User ratings of stories

=head1 SYNOPSIS

  # Similarity between $story1 and $story2
  $self->$method($story1, $story2);

  # Similarity between $user1 and $user2
  $self->$method($user1, $user2)
  
=cut

=head1 METHODS

=head2 sim_pearson

Calculates the Pearson correlation (r) between items.

=cut

sub sim_pearson {
	my( $self, $item1, $item2 ) = @_;

	my( $prefs1, $prefs2 ) = $self->_shared_item_ratings($item1, $item2);

	my $n = $prefs1->func('count');
	return 0 if $n == 0;

	# Calculate sums
	my($sum1, $sum2, $sqsum1, $sqsum2, $product_sum);
	while( defined(my $r1 = $prefs1->next) and defined(my $r2 = $prefs2->next) ) {
		$sum1 += $r1;
		$sum2 += $r2;
		$sqsum1 += $r1 ** 2;
		$sqsum2 += $r2 ** 2;
		$product_sum += $r1 * $r2;
	}

	# Cacluate Pearson r
	my $num = $product_sum - ($sum1 * $sum2 / $n);
	my $den = sqrt( ($sqsum1 - $sum1 ** 2 / $n) * ($sqsum2 - $sum2 ** 2 / $n ) );

	return 0 if $den == 0; #Watch out for divide by zero errors
	return $num / $den;
}

=head2 sim_cosine

Calculates the cosine distance between two item's rating vectors.

=cut

sub sim_cosine {
	my( $self, $item1, $item2 ) = @_;

	my( $vec1, $vec2 ) = $self->_shared_item_ratings($item1, $item2);

	my $n = $vec1->func('count');
	return 0 if $n == 0;

	# Calculate dot product and abs
	my($abs1, $abs2, $dot_product);
	while( defined(my $r1 = $vec1->next) and defined(my $r2 = $vec2->next) ) {
		$abs1 += $r1 ** 2;
		$abs2 += $r2 ** 2;
		$dot_product += $r1 * $r2;
	}

	return $dot_product / ( sqrt($abs1) * sqrt($abs2) );
}

sub _shared_item_ratings {
	# Returns the ratings of the items that both users have rated
	my( $self, $item1, $item2 ) = @_;

	croak "Items are not the same object" if ref $item1 ne ref $item2;

	my($key, $fkey);
	if( substr(ref $item1, -4) eq 'User' ) {
		($key, $fkey) = ('user_id', 'story_id');
	}
	elsif( substr(ref $item1, -5) eq 'Story' ) {
		($key, $fkey) = ('story_id', 'user_id');
	}
	else {
		croak 'Arguments neither a Story nor User: ' . ref $item1;
	}

	# Assuming players have ranked all items, this check is unnecessary
	# #
	# my $inner1 = $self->search({ $key => $item1->id })->get_column($fkey);
	# my $inner2 = $self->search({ $key => $item2->id })->get_column($fkey);

	# my $prefs1 = $self->search({
	# 	$key  => $item1->id,
	# 	$fkey => { -in => $inner2->as_query },
	# })->get_column('value');

	# my $prefs2 = $self->search({
	# 	$key  => $item2->id,
	# 	$fkey => { -in => $inner1->as_query },
	# })->get_column('value');

	my $vector1 = $self->search({ $key => $item1->id })->get_column('value');
	my $vector2 = $self->search({ $key => $item2->id })->get_column('value');

	return ($vector1, $vector2);
}

1;