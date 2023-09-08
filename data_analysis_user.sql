-- User's Perspective

-- (1) What is the annual average number of comments posted by normal users? elite users?
-- What is the percentage of useful, funny, cool comments by normal and elite users? 

SELECT *
from `yelp_user`
limit 10;

-- Select distinct 'yelping_since' values
-- from the 'yelp_user' table, ordered by descending date
-- and limit the result to 1 row (the most recent date)
SELECT DISTINCT(yelping_since)
FROM `yelp_user`
ORDER BY yelping_since DESC
LIMIT 1;

-- Select 'user_id', calculate the registration time as the difference
-- between "2017-f12-11" and 'yelping_since', and calculate the average
-- review per day for non-elite users (elite="None").
SELECT
    user_id,
    DATEDIFF("2017-12-11", yelping_since) as register_time,
    (review_count / DATEDIFF("2017-12-11", yelping_since)) as avg_review_day
FROM `yelp_user`
WHERE elite = "None";

-- Calculate the average of 'avg_review_day' values for non-elite users.
SELECT AVG(sub.avg_review_day) as avg_review_day_nelite
FROM (
    -- Subquery to calculate 'avg_review_day' for non-elite users
    SELECT
        user_id,
        DATEDIFF("2017-12-11", yelping_since) as register_time,
        (review_count / DATEDIFF("2017-12-11", yelping_since)) as avg_review_day
    FROM `yelp_user`
    WHERE elite = "None"
) as sub;

-- Calculate the total review count for non-elite users,
-- as well as the rates of 'useful,' 'funny,' and 'cool' votes per review.
SELECT
    SUM(review_count) as total_review_count,
    SUM(useful) / SUM(review_count) as useful_rate_ne,
    SUM(funny) / SUM(review_count) as funny_rate_ne,
    SUM(cool) / SUM(review_count) as cool_rate_ne
FROM `yelp_user`
WHERE elite = "None";

-- Calculate the average of 'avg_review_day' values for elite users.
SELECT AVG(sub.avg_review_day) as avg_review_day_elite
FROM (
    -- Subquery to calculate 'avg_review_day' for elite users
    SELECT
        user_id,
        DATEDIFF("2017-12-11", yelping_since) as register_time,
        (review_count / DATEDIFF("2017-12-11", yelping_since)) as avg_review_day
    FROM `yelp_user`
    WHERE elite <> "None"
) as sub;
-- we find that the review frequency for elite user is 0.0979 times that of non-ellite user

-- Calculate the total review count for elite users,
-- as well as the rates of 'useful,' 'funny,' and 'cool' votes per review.
SELECT
    SUM(review_count) as total_review_count,
    SUM(useful) / SUM(review_count) as useful_rate_e,
    SUM(funny) / SUM(review_count) as funny_rate_e,
    SUM(cool) / SUM(review_count) as cool_rate_e
FROM `yelp_user`
WHERE elite <> "None";



-- (2) For review who receive a lot of 'useful' mark, what are some trends in the length of the review? 
-- what about those who receive 'funny' and 'cool' mark? 

SELECT *
from `yelp_review`
limit 10;

-- Calculate the count of reviews with 'useful' values greater than 1000,
-- the average star rating rounded to one decimal place,
-- and the average length of reviews rounded to the nearest whole number.
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 1000
) as sub;

-- Calculate the count of reviews with 'useful' values greater than 500,
-- the average star rating rounded to one decimal place,
-- and the average length of reviews rounded to the nearest whole number.
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 500
) as sub;

-- Calculate the count of reviews with 'useful' values greater than 200,
-- the average star rating rounded to one decimal place,
-- and the average length of reviews rounded to the nearest whole number.
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 200
) as sub;

-- Calculate the count of reviews with 'useful' values greater than 100,
-- the average star rating rounded to one decimal place,
-- and the average length of reviews rounded to the nearest whole number.
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE useful > 100
) as sub;

-- funny
-- Calculate the count of reviews with 'funny' values greater than 500,
-- the average star rating rounded to one decimal place,
-- and the average length of reviews rounded to the nearest whole number.
SELECT
    COUNT(sub.text) as review_count,
    ROUND(AVG(sub.stars), 1) as avg_stars,
    ROUND(AVG(sub.len), 0) as avg_length
FROM (
    -- Subquery to select relevant data from yelp_review
    SELECT stars, text, LENGTH(text) as len, useful
    FROM yelp_review
    WHERE funny > 500
) as sub;

select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, funny
FROM yelp_review
WHERE funny>200
) as sub;

select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, funny
FROM yelp_review
WHERE funny>100
) as sub;

-- cool
select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, cool
FROM yelp_review
WHERE cool>500
) as sub;

select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, cool
FROM yelp_review
WHERE cool>200
) as sub;

select count(sub.text), round(avg(sub.stars),1), round(avg(sub.len),0)
from(SELECT stars, text, length(text) as len, cool
FROM yelp_review
WHERE cool>100
) as sub;



-- (3) For each review star, what are the corresponding business stars? 
-- Calculate the average business star rating for each unique review star rating,
-- ordering the results by review star rating in descending order.
SELECT
    yelp_review.stars,
    ROUND(AVG(yelp_business.stars), 2) as avg_busi_star
FROM
    yelp_review
LEFT JOIN
    yelp_business
ON
    yelp_review.business_id = yelp_business.business_id
GROUP BY
    yelp_review.stars
ORDER BY
    yelp_review.stars DESC;
    
-- Calculate the count of businesses, count of reviews with a star rating of 5,
-- and the ratio of businesses to reviews with a star rating of 5.
SELECT
    yelp_business.stars,
    COUNT(yelp_business.business_id) AS count_busi,
    COUNT(review_id) AS count_re,
    ROUND(COUNT(yelp_business.business_id) / COUNT(review_id), 2) AS rate_5
FROM
    yelp_review
LEFT JOIN
    yelp_business
ON
    yelp_review.business_id = yelp_business.business_id
WHERE
    yelp_review.stars = 5
GROUP BY
    yelp_business.stars 
ORDER BY 
yelp_business.stars DESC;

-- for 1 star
SELECT yelp_business.stars, count(yelp_business.business_id) AS count_busi
FROM yelp_review LEFT JOIN yelp_business
ON yelp_review.business_id=yelp_business.business_id
WHERE yelp_review.stars = 1
GROUP BY yelp_business.stars DESC;



-- (4) Relationship between number of review and photos and number of followers
-- relationship between number of followers and whether elite user
SELECT sum(fans), sum(review_count), sum(compliment_photos), sum(review_count)/sum(
fans)as fans_re_rate_e, sum(compliment_photos)/sum(fans)as fans_ph_rate_e
FROM `yelp_user`
WHERE elite<>"None";

SELECT sum(fans), sum(review_count), sum(compliment_photos), sum(review_count)/sum(
fans)as fans_re_rate_e, sum(compliment_photos)/sum(fans)as fans_ph_rate_e
FROM `yelp_user`
WHERE elite="None";

SELECT count(user_id), sum(fans), sum(fans)/count(user_id) as fans_rate_e
FROM `yelp_user`
WHERE elite<>"None";

SELECT count(user_id), sum(fans), sum(fans)/count(user_id) as fans_rate_ne
FROM `yelp_user`
WHERE elite="None";



-- (5) Popular city to be commented
SELECT yelp_business.state, COUNT(yelp_review.review_id) AS count_re_state
FROM yelp_review LEFT JOIN yelp_business
ON yelp_review.business_id = yelp_business.business_id
GROUP BY yelp_business.state
ORDER BY count_re_state DESC






