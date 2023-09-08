-- Restaurant's Perspective

-- (1) Number of Restaurant by star; average star; relationship between star and number of review, average star in review, 
-- ratio of good and bad review
SELECT *
from `yelp_business`
limit 10;

SELECT round(avg(stars),1)
FROM yelp_business;

SELECT stars, count(business_id)
FROM yelp_business
GROUP BY stars
ORDER BY stars DESC;

SELECT
    yelp_business.stars,
    ROUND(AVG(yelp_review.stars), 2) as avg_re_star,
    COUNT(review_id) as count_re
FROM
    yelp_business
RIGHT JOIN
    yelp_review
ON
    yelp_business.business_id = yelp_review.business_id
GROUP BY
    yelp_business.stars
ORDER BY
    yelp_business.stars DESC;
    
    
    
-- (2) Num Restaurant, star, by state
SELECT state, count(state)
FROM yelp_business 
GROUP BY state
ORDER BY count(state) DESC

-- Calculate statistics related to star ratings for businesses grouped by state.
SELECT
    state,
    COUNT(state) as count_state,
    SUM(CASE stars WHEN 5.0 THEN 1 ELSE 0 END) as sum_5,
    (SUM(CASE stars WHEN 5.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_5,
    SUM(CASE stars WHEN 4.5 THEN 1 ELSE 0 END) as sum_4_5,
    (SUM(CASE stars WHEN 4.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_4_5,
    SUM(CASE stars WHEN 4.0 THEN 1 ELSE 0 END) as sum_4,
    (SUM(CASE stars WHEN 4.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_4,
    SUM(CASE stars WHEN 3.5 THEN 1 ELSE 0 END) as sum_3_5,
    (SUM(CASE stars WHEN 3.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_3_5,
    SUM(CASE stars WHEN 3.0 THEN 1 ELSE 0 END) as sum_3,
    (SUM(CASE stars WHEN 3.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_3,
    SUM(CASE stars WHEN 2.5 THEN 1 ELSE 0 END) as sum_2_5,
    (SUM(CASE stars WHEN 2.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_2_5,
    SUM(CASE stars WHEN 2.0 THEN 1 ELSE 0 END) as sum_2,
    (SUM(CASE stars WHEN 2.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_2,
    SUM(CASE stars WHEN 1.5 THEN 1 ELSE 0 END) as sum_1_5,
    (SUM(CASE stars WHEN 1.5 THEN 1 ELSE 0 END) / COUNT(state)) as rate_1_5,
    SUM(CASE stars WHEN 1.0 THEN 1 ELSE 0 END) as sum_1,
    (SUM(CASE stars WHEN 1.0 THEN 1 ELSE 0 END) / COUNT(state)) as rate_1
FROM
    yelp_business
GROUP BY
    state
ORDER BY
    count_state DESC;



-- (3) Relationship of star and business day
SELECT
    business_id,
    (
        (CASE WHEN monday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN tuesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN wednesday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN thursday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN friday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN saturday = 'None' THEN 0 ELSE 1 END) +
        (CASE WHEN sunday = 'None' THEN 0 ELSE 1 END)
    ) AS open_days
FROM
    yelp_business_hours;

-- Calculate the count of businesses with different star ratings
-- based on the number of open days.
SELECT
    open_days.open_days,
    SUM(CASE yelp_business.stars WHEN 5.0 THEN 1 ELSE 0 END) as sum_5,
    SUM(CASE yelp_business.stars WHEN 4.5 THEN 1 ELSE 0 END) as sum_4_5,
    SUM(CASE yelp_business.stars WHEN 4.0 THEN 1 ELSE 0 END) as sum_4,
    SUM(CASE yelp_business.stars WHEN 3.5 THEN 1 ELSE 0 END) as sum_3_5,
    SUM(CASE yelp_business.stars WHEN 3.0 THEN 1 ELSE 0 END) as sum_3,
    SUM(CASE yelp_business.stars WHEN 2.5 THEN 1 ELSE 0 END) as sum_2_5,
    SUM(CASE yelp_business.stars WHEN 2.0 THEN 1 ELSE 0 END) as sum_2,
    SUM(CASE yelp_business.stars WHEN 1.5 THEN 1 ELSE 0 END) as sum_1_5,
    SUM(CASE yelp_business.stars WHEN 1.0 THEN 1 ELSE 0 END) as sum_1
FROM
    yelp_business
LEFT JOIN
    open_days
ON
    yelp_business.business_id = open_days.business_id
GROUP BY
    open_days.open_days;



-- (4) For closed restaurant, what are some trends in business day and star
-- Calculate the average number of open days and the average star rating
-- for businesses that are not open (is_open = 0).
SELECT
    ROUND(AVG(open_days.open_days), 1) as avg_open,
    ROUND(AVG(yelp_business.stars), 2) as avg_stars
FROM
    yelp_business
LEFT JOIN
    open_days
ON
    yelp_business.business_id = open_days.business_id
WHERE
    yelp_business.is_open = 0;


