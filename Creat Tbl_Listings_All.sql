
USE  bm_maven_project;
create table Listings_ALL (
listing_id INT,
listing_name TEXT,
host_id INT,
host_since DATE,
host_location TEXT,

host_response_time TEXT,
host_response_rate INT,
host_acceptance_rate INT,
host_is_superhost TEXT,
host_total_listings_count INT,
host_has_profile_pic TEXT,
host_identity_verified TEXT,
neighbourhood TEXT,
district TEXT,
city TEXT,
latitude DOUBLE,
longitude DOUBLE,
property_type TEXT,
room_type TEXT,
accommodates INT,
bedrooms INT,
amenities TEXT,
price DOUBLE,
minimum_nights INT,
maximum_nights INT,
review_scores_rating INT,
review_scores_accuracy INT,
review_scores_cleanliness INT,
review_scores_checkin INT,
review_scores_communication INT,
review_scores_location INT,
review_scores_value INT,
instant_bookable TEXT
);

set global local_infile=true;
LOAD DATA LOCAL INFILE 'C:/Users/bmurth01/Downloads/Airbnb+Data/Airbnb Data/Listings - 2.csv'
INTO TABLE listings_all
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Select * from listings_all;