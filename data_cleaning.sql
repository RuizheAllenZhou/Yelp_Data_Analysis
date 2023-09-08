-- Yelp_Business
-- Select all columns from the 'yelp_business' table
SELECT *
FROM `yelp_business`
-- Filter the results where 'name' is NULL
-- or 'state' is NULL
-- or 'stars' is less than 0 or greater than 5
WHERE
    name IS NULL
    OR state IS NULL
    OR stars < 0
    OR stars > 5;
    
SELECT *
FROM `yelp_business`
WHERE is_open=1;

SELECT *
FROM `yelp_business`
WHERE is_open=0;

-- Yelp_Business_hours
SELECT *
FROM `yelp_business_hours`
WHERE
    monday <> "None"
    OR tuesday <> "None"
    OR wednesday <> "None"
    OR thursday <> "None"
    OR friday <> "None"
    OR saturday <> "None"
    OR sunday <> "None";
    
-- Yelp_checkins
SELECT *
FROM `yelp_checkin`
WHERE
    weekday IS NULL
    OR hour IS NULL
    OR checkins IS NULL;
    
    
-- yelp_review
SELECT *
FROM yelp_review
-- Filter the results where 'review_id' is NULL
-- or 'business_id' is NULL
-- or 'user_id' is NULL
-- or 'date' is NULL
-- or 'stars' is less than 0 or greater than 5
WHERE
    review_id IS NULL
    OR business_id IS NULL
    OR user_id IS NULL
    OR date IS NULL
    OR stars < 0
    OR stars > 5;
    
-- yelp_tip
SELECT *
FROM yelp_tip
-- Filter the results where 'text' is NULL
-- or 'business_id' is NULL
-- or 'user_id' is NULL
-- or 'date' is NULL
-- or 'likes' is less than 0
WHERE
    text IS NULL
    OR business_id IS NULL
    OR user_id IS NULL
    OR date IS NULL
    OR likes < 0;
    
-- yelp_user
-- Select all columns from the 'yelp_user' table
SELECT *
FROM `yelp_user`
-- Filter the results where any of the following conditions are met:
-- 'useful' is less than 0
-- 'funny' is less than 0
-- 'cool' is less than 0
-- 'fans' is less than 0
-- 'average_stars' is less than 0
-- 'average_stars' is greater than 5
WHERE
    useful < 0
    OR funny < 0
    OR cool < 0
    OR fans < 0
    OR average_stars < 0
    OR average_stars > 5;
    
SELECT *
FROM `yelp_user`
WHERE
    name IS NOT NULL
    AND review_count IS NOT NULL
    AND yelping_since IS NOT NULL;
    
-- cleaning finished and all the tables are fine
