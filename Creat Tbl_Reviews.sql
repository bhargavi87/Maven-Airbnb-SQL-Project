Use bm_maven_project;
Create Table Reviews(
listing_id int,
review_id int,
Review_date Date,
reviewer_id int);

set global local_infile=true;
LOAD DATA LOCAL INFILE 'C:/Users/bmurth01/Downloads/Airbnb+Data/Airbnb Data/Reviews.csv'
INTO TABLE Reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from reviews;
