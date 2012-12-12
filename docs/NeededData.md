stories:
	id,
	user_id,
	wordcount,
	tags,
	characters,
	rating,
chapters:
	id,
	story_id,
	wordcount,
	publish time,
views:
	user_id,
	chapter_id (story_id?),
	timestamp,
likes:
	user_id,
	story_id,
	timestamp,
dislikes:
	user_id,
	story_id,
	timestamp,
favourites:
	user_id,
	story_id,
	timestamp,