Criteria
--------

It's a recommendation system that's going to be used by people. The backbone is all soulless maths and algorithms, but there's a lot of ways to go about this. There are a number of criteria that the system ought to consider.

Ratings
=======

The first question to ask is obviously, "What is a rating on Fimfiction?" The likes/dislikes meter is almost always fully green. People rarely want to give something the red thumb down unless it really ground their gears.

But there's other data available to gauge a person's impression of a story. Say a person read a story, but didn't cast a vote on it – that's still useful data. That they didn't form a strong enough opinion on the work still lets us know that their impression was middling.

So we can set up the following impression levels:

1. Dislike
2. View
3. Like
4. Favourite
5. Like & favourite

This seems fairly diverse. There is some consideration needed to be made about a person who views only half a story. Is a story viewed if the person read at least one chapter, or only if all the chapters are viewed? A person can cast a vote without even having read the story, and anyone favouriting an incomplete multi-chapter story would certainly not have viewed it whenever it updates. For the sake of simplicity, a person is considered to have viewed a story if they have read at least one chapter (and by "read" I of course mean "opened the page").

The use of views as data points gives more variability in a user's impression beyond whether or not they "liked" it.

Diversity
=========

It can't be said enough that a lack of diversity plagues all kinds of recommendation systems, both automated and non-automated (top 40 radio stations). Aside from the obvious rich-get-richer problems, a person might pigeonhole themselves too easily into only looking for things based on certain criteria – tags, characters, etc – despite being much inclined to like things that fall outside of those criteria.

The system ought not to only give people accurate recommendations, but to recommend items that are somewhat dissimilar from each other. This allows readers to discover things they otherwise wouldn't.

Freshness
=========

A purely rating-based recommendation system doesn't consider the age of an item. In popular e-commerce recommendation systems, such data isn't relevant – when a product was released doesn't matter all that much to a potential buyer. But the art world is constantly moving, and people want to read what's new.

The best metric for this in Fimfiction would be the publish date of the last published chapter.

Some might argue that this favours stories that publish shorter chapters periodically, but I think that reinforcing such behaviours isn't such a bad idea. Firstly, short stories ought not be given as much exposure than novels simply because they take less time to complete. A person who writes twenty 6,000 word short stories isn't deserving of more exposure than a person who writes a single 120k novel. (The former still gets more exposure, but this counter-measure at least helps things.)

The other issue with this is the possibility of abuse. Surely people would start spamming chapters to make sure the system counts their story as "fresh"? Well, changing the criteria to "Most recent published chapter of at least `x` words" isn't exactly difficult.

In addition to making sure the recommended items are fresh, making sure that the recommendations are made from fresh data is a big deal as well. A person's taste changes over time, and nobody wants to be doomed by their teenage mistake of thinking *Kung Pow* was a good film. By only considering recently cast ratings, a picture closer to the person the recommendations are actually being made to is drawn.

A big reason why this metric is a good idea is that it drastically reduces the complexity of the computations. Scalability is one of the biggest issues with recommendation algorithms, so narrowing down the pool of considered items drastically improves performance. (Of course, that's not to say I'm not also using other techniques to achieve reduced dimensional space...)