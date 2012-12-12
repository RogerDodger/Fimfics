use utf8;
package Fimfics::Schema::Result::UserSim;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Fimfics::Schema::Result::UserSim

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<user_sims>

=cut

__PACKAGE__->table("user_sims");

=head1 ACCESSORS

=head2 user1_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 user2_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 similarity

  data_type: 'real'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "user1_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "user2_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "similarity",
  { data_type => "real", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user1_id>

=item * L</user2_id>

=back

=cut

__PACKAGE__->set_primary_key("user1_id", "user2_id");

=head1 RELATIONS

=head2 user1

Type: belongs_to

Related object: L<Fimfics::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user1",
  "Fimfics::Schema::Result::User",
  { id => "user1_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 user2

Type: belongs_to

Related object: L<Fimfics::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user2",
  "Fimfics::Schema::Result::User",
  { id => "user2_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-12-08 11:51:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8gfhWGFqHw338qsZEO3v2Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
