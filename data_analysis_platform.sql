-- Platform's Perspective

-- (1) Num of user regsterations by year and month; num of reviews
SELECT YEAR(yelping_since) as year_since, count(user_id)
FROM yelp_user
GROUP BY YEAR(yelping_since)
ORDER BY YEAR(yelping_since) ASC;

-- Retrieve the count of users who joined Yelp in each year and month
-- along with their user IDs, the year they joined, and the month they joined.
SELECT
    YEAR(yelping_since) as year_since,
    MONTH(yelping_since) as month_since,
    COUNT(user_id)
FROM
    yelp_user
GROUP BY
    YEAR(yelping_since),
    MONTH(yelping_since);

-- Num reviews by year
SELECT YEAR(date) as year_review, count(review_id)
FROM yelp_review
GROUP BY YEAR(date)
ORDER BY YEAR(date) ASC;



-- (2) Percentage of Elite users by year
-- find those who are elite users for at least one year. 
SELECT *
from `yelp_user`
where elite <> 'None'
limit 5;

SELECT user_id, elite
FROM yelp_user
WHERE elite <> 'None'; 

-- Calculate the count of users with elite status in each year from 2004 to 2017.
SELECT
    SUM(CASE WHEN elite LIKE '%2004%' THEN 1 ELSE 0 END) as 2004_elite,
    SUM(CASE WHEN elite LIKE '%2005%' THEN 1 ELSE 0 END) as 2005_elite,
    SUM(CASE WHEN elite LIKE '%2006%' THEN 1 ELSE 0 END) as 2006_elite,
    SUM(CASE WHEN elite LIKE '%2007%' THEN 1 ELSE 0 END) as 2007_elite,
    SUM(CASE WHEN elite LIKE '%2008%' THEN 1 ELSE 0 END) as 2008_elite,
    SUM(CASE WHEN elite LIKE '%2009%' THEN 1 ELSE 0 END) as 2009_elite,
    SUM(CASE WHEN elite LIKE '%2010%' THEN 1 ELSE 0 END) as 2010_elite,
    SUM(CASE WHEN elite LIKE '%2011%' THEN 1 ELSE 0 END) as 2011_elite,
    SUM(CASE WHEN elite LIKE '%2012%' THEN 1 ELSE 0 END) as 2012_elite,
    SUM(CASE WHEN elite LIKE '%2013%' THEN 1 ELSE 0 END) as 2013_elite,
    SUM(CASE WHEN elite LIKE '%2014%' THEN 1 ELSE 0 END) as 2014_elite,
    SUM(CASE WHEN elite LIKE '%2015%' THEN 1 ELSE 0 END) as 2015_elite,
    SUM(CASE WHEN elite LIKE '%2016%' THEN 1 ELSE 0 END) as 2016_elite,
    SUM(CASE WHEN elite LIKE '%2017%' THEN 1 ELSE 0 END) as 2017_elite
FROM
    elite;



-- (3) User Retention by year
-- Calculate the count of reviews posted by each user in each year from 2008 to 2017.
SELECT
    user_id,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2008 THEN 1 ELSE 0 END) as 2008_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2009 THEN 1 ELSE 0 END) as 2009_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2010 THEN 1 ELSE 0 END) as 2010_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2011 THEN 1 ELSE 0 END) as 2011_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2012 THEN 1 ELSE 0 END) as 2012_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2013 THEN 1 ELSE 0 END) as 2013_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2014 THEN 1 ELSE 0 END) as 2014_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2015 THEN 1 ELSE 0 END) as 2015_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2016 THEN 1 ELSE 0 END) as 2016_exist,
    SUM(CASE WHEN YEAR(yelp_review.date) = 2017 THEN 1 ELSE 0 END) as 2017_exist
FROM
    yelp_review
GROUP BY
    user_id;

-- Calculate the proportion of users who posted reviews in consecutive years for each pair of years from 2008 to 2017.
SELECT
    ROUND(SUM(CASE WHEN (2008_exist <> 0 AND 2009_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2008_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2009,
    ROUND(SUM(CASE WHEN (2009_exist <> 0 AND 2010_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2009_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2010,
    ROUND(SUM(CASE WHEN (2010_exist <> 0 AND 2011_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2010_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2011,
    ROUND(SUM(CASE WHEN (2011_exist <> 0 AND 2012_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2011_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2012,
    ROUND(SUM(CASE WHEN (2012_exist <> 0 AND 2013_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2012_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2013,
    ROUND(SUM(CASE WHEN (2013_exist <> 0 AND 2014_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2013_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2014,
    ROUND(SUM(CASE WHEN (2014_exist <> 0 AND 2015_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2014_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2015,
    ROUND(SUM(CASE WHEN (2015_exist <> 0 AND 2016_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2015_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2016,
    ROUND(SUM(CASE WHEN (2016_exist <> 0 AND 2017_exist <> 0) THEN 1 ELSE 0 END) / SUM(CASE WHEN 2016_exist <> 0 THEN 1 ELSE 0 END), 2) AS exist_2017
FROM
    user_keep;
    
-- Calculate the proportion of users who had elite status in consecutive years for each pair of years from 2005 to 2017.
SELECT
    ROUND(SUM(CASE WHEN (elite LIKE '%2005%' AND elite LIKE '%2006%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2005%' THEN 1 ELSE 0 END), 2) AS exist_2006,
    ROUND(SUM(CASE WHEN (elite LIKE '%2006%' AND elite LIKE '%2007%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2006%' THEN 1 ELSE 0 END), 2) AS exist_2007,
    ROUND(SUM(CASE WHEN (elite LIKE '%2007%' AND elite LIKE '%2008%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2007%' THEN 1 ELSE 0 END), 2) AS exist_2008,
    ROUND(SUM(CASE WHEN (elite LIKE '%2008%' AND elite LIKE '%2009%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2008%' THEN 1 ELSE 0 END), 2) AS exist_2009,
    ROUND(SUM(CASE WHEN (elite LIKE '%2009%' AND elite LIKE '%2010%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2009%' THEN 1 ELSE 0 END), 2) AS exist_2010,
    ROUND(SUM(CASE WHEN (elite LIKE '%2010%' AND elite LIKE '%2011%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2010%' THEN 1 ELSE 0 END), 2) AS exist_2011,
    ROUND(SUM(CASE WHEN (elite LIKE '%2011%' AND elite LIKE '%2012%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2011%' THEN 1 ELSE 0 END), 2) AS exist_2012,
    ROUND(SUM(CASE WHEN (elite LIKE '%2012%' AND elite LIKE '%2013%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2012%' THEN 1 ELSE 0 END), 2) AS exist_2013,
    ROUND(SUM(CASE WHEN (elite LIKE '%2013%' AND elite LIKE '%2014%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2013%' THEN 1 ELSE 0 END), 2) AS exist_2014,
    ROUND(SUM(CASE WHEN (elite LIKE '%2014%' AND elite LIKE '%2015%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2014%' THEN 1 ELSE 0 END), 2) AS exist_2015,
    ROUND(SUM(CASE WHEN (elite LIKE '%2015%' AND elite LIKE '%2016%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2015%' THEN 1 ELSE 0 END), 2) AS exist_2016,
    ROUND(SUM(CASE WHEN (elite LIKE '%2016%' AND elite LIKE '%2017%') THEN 1 ELSE 0 END) / SUM(CASE WHEN elite LIKE '%2016%' THEN 1 ELSE 0 END), 2) AS exist_2017
FROM
    elite;

