use Yelp;

CREATE TABLE yelp_business
(
    business_id VARCHAR(100) 
    , name VARCHAR(100) DEFAULT NULL
    , neighborhood VARCHAR(100) DEFAULT NULL
    , address VARCHAR(200) DEFAULT NULL
    , city VARCHAR(100) DEFAULT NULL
    , state VARCHAR(100) DEFAULT NULL
    , postal_code VARCHAR(100) DEFAULT NULL
    , latitude VARCHAR(100) DEFAULT NULL
    , longitude VARCHAR(100) DEFAULT NULL
    , stars DECIMAL(2, 1) DEFAULT NULL
    , review_count INT DEFAULT NULL
    , is_open INT DEFAULT NULL
    , categories VARCHAR(500) DEFAULT NULL
    , PRIMARY KEY (business_id)
);

show tables;

# SET GLOBAL local_infile=1；

load data local infile '/Users/zhouruizhe/Desktop/OR/Yelp/yelp_business.csv'
into table yelp.yelp_business
fields terminated by ','
optionally enclosed by '"'
ignore 1 lines; 



CREATE TABLE yelp_business_hours
(
    business_id VARCHAR(100) 
    , monday VARCHAR(100) DEFAULT NULL
    , tuesday VARCHAR(100) DEFAULT NULL
    , wednesday VARCHAR(100) DEFAULT NULL
    , thursday VARCHAR(100) DEFAULT NULL
    , friday VARCHAR(100) DEFAULT NULL
    , saturday VARCHAR(100) DEFAULT NULL
    , sunday VARCHAR(100) DEFAULT NULL
    , PRIMARY KEY (business_id)
);

LOAD DATA LOCAL INFILE '/Users/zhouruizhe/Desktop/OR/Yelp/yelp_business_hours.csv'
INTO TABLE yelp.yelp_business_hours
FIELDS TERMINATED BY ','
IGNORE 1 LINES;



CREATE TABLE yelp_checkin
(
    business_id VARCHAR(100) 
    , weekday VARCHAR(100) DEFAULT NULL
    , hour VARCHAR(100) DEFAULT NULL
    , checkins VARCHAR(100) DEFAULT NULL
    , PRIMARY KEY (business_id)
);

LOAD DATA LOCAL INFILE '/Users/zhouruizhe/Desktop/OR/Yelp/yelp_checkin.csv'
INTO TABLE yelp.yelp_checkin
FIELDS TERMINATED BY ','
IGNORE 1 LINES;



CREATE TABLE yelp_tip
(
    text VARCHAR(1000) DEFAULT NULL
    , date DATE DEFAULT NULL 
    , likes INT DEFAULT NULL 
    , business_id VARCHAR(100) DEFAULT NULL
    , user_id VARCHAR(100) DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/Users/zhouruizhe/Desktop/OR/Yelp/yelp_tip.csv'
INTO TABLE yelp.yelp_tip 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;



CREATE TABLE yelp_user
(
    user_id VARCHAR(100) 
    , name VARCHAR(100) DEFAULT NULL 
    , review_count INT DEFAULT NULL
    , yelping_since VARCHAR(100) DEFAULT NULL
    , friends MEDIUMTEXT DEFAULT NULL
    , useful INT DEFAULT NULL
    , funny INT DEFAULT NULL
    , cool INT DEFAULT NULL
    , fans INT DEFAULT NULL
    , elite VARCHAR(100) DEFAULT NULL
    , average_stars DECIMAL(3, 2) DEFAULT NULL
    , compliment_hot INT DEFAULT NULL
    , compliment_more INT DEFAULT NULL
    , compliment_profile INT DEFAULT NULL
    , compliment_cute INT DEFAULT NULL
    , compliment_list INT DEFAULT NULL
    , compliment_note INT DEFAULT NULL
    , compliment_plain INT DEFAULT NULL
    , compliment_cool INT DEFAULT NULL
    , compliment_funny INT DEFAULT NULL
    , compliment_writer INT DEFAULT NULL
    , compliment_photos INT DEFAULT NULL
    , PRIMARY KEY (user_id)
);

LOAD DATA LOCAL INFILE '/Users/zhouruizhe/Desktop/OR/Yelp/yelp_user.csv'
INTO TABLE yelp.yelp_user 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;



CREATE TABLE yelp_review
(
    review_id VARCHAR(100) DEFAULT NULL
    , user_id VARCHAR(100) DEFAULT NULL
    , business_id VARCHAR(100) DEFAULT NULL
    , stars INT DEFAULT NULL
    , date DATE DEFAULT NULL
    , text LONGTEXT DEFAULT NULL
    , useful INT DEFAULT NULL
    , funny INT DEFAULT NULL
    , cool INT DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/Users/zhouruizhe/Desktop/OR/Yelp/yelp_review.csv'
INTO TABLE yelp.yelp_review 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
