/datum/movespeed_modifier/shrink_ray
	id = MOVESPEED_ID_SHRINK_RAY
	movetypes = GROUND
	multiplicative_slowdown = 4

/datum/movespeed_modifier/snail_crawl
	id = MOVESPEED_ID_SNAIL_CRAWL
	multiplicative_slowdown = -7
	movetypes = GROUND

/datum/movespeed_modifier/sanity
	id = MOVESPEED_ID_SANITY
	movetypes = (~FLYING)

/datum/movespeed_modifier/sanity/insane
	multiplicative_slowdown = 1

/datum/movespeed_modifier/sanity/crazy
	multiplicative_slowdown = 0.5

/datum/movespeed_modifier/sanity/disturbed
	multiplicative_slowdown = 0.25
