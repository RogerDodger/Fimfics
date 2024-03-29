use utf8;
package Fimfics::Schema::Result::Story;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Fimfics::Schema::Result::Story

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

=head1 TABLE: C<storys>

=cut

__PACKAGE__->table("storys");

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
  { "foreign.story_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 story_sims_story1s

Type: has_many

Related object: L<Fimfics::Schema::Result::StorySim>

=cut

__PACKAGE__->has_many(
  "story_sims_story1s",
  "Fimfics::Schema::Result::StorySim",
  { "foreign.story1_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 story_sims_story2s

Type: has_many

Related object: L<Fimfics::Schema::Result::StorySim>

=cut

__PACKAGE__->has_many(
  "story_sims_story2s",
  "Fimfics::Schema::Result::StorySim",
  { "foreign.story2_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-12-08 11:51:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Epr9Jloq/Id3Srp5ugrXOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
