package Fimfics::Schema::Result::Rating;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('Rating');

__PACKAGE__->add_columns(
	"story_id",
	{ data_type => "integer" },
	"user_id",
	{ data_type => "integer" },
	"value",
	{ data_type => "integer" },
);

__PACKAGE__->belongs_to(
	"story",
	"Fimfics::Schema::Result::Story",
	{ id => "story_id" },
);

__PACKAGE__->belongs_to(
	"user",
	"Fimfics::Schema::Result::User",
	{ id => "user_id" },
);

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition('
	SELECT 
		users.id AS user_id, 
		storys.id AS story_id, 
	(
		SELECT COUNT(*) 
		FROM favs
		WHERE user_id = users.id AND story_id = storys.id
	)
		AS value
	FROM users,storys
');

__PACKAGE__->result_source_instance->deploy_depends_on([
	map { "Fimfics::Schema::Result::$_" } qw/Story User Fav/
]);

1;