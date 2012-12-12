use utf8;
package Fimfics::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Fimfics::Schema::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 favs

Type: has_many

Related object: L<Fimfics::Schema::Result::Fav>

=cut

__PACKAGE__->has_many(
  "favs",
  "Fimfics::Schema::Result::Fav",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_sims_user1s

Type: has_many

Related object: L<Fimfics::Schema::Result::UserSim>

=cut

__PACKAGE__->has_many(
  "user_sims_user1s",
  "Fimfics::Schema::Result::UserSim",
  { "foreign.user1_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_sims_user2s

Type: has_many

Related object: L<Fimfics::Schema::Result::UserSim>

=cut

__PACKAGE__->has_many(
  "user_sims_user2s",
  "Fimfics::Schema::Result::UserSim",
  { "foreign.user2_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-12-08 11:51:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9xXPvbFY17kfx/6/q/Gqjg



# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
