Use bm_maven_project;
-- Review count from review table
With review_Count as (select listing_id as rc_listing_id ,count(review_id) as num_of_reviews from reviews
group by listing_id), 

-- Joining listing_all and reviews;

Listing_reviewcount_rating as (select 
listing_id,
room_type,
property_type,
bedrooms,
accommodates,
neighbourhood,
Amenities,
price , 
Review_scores_rating,
 COALESCE(rc.num_of_reviews,0) as review_count
 from listings_all l left join review_count rc on l.listing_id = rc.rc_listing_id),

-- Filtering for Aurlia neighbourhood
Aurelia_rating as(Select * from  Listing_reviewcount_rating
Where neighbourhood ="XIII Aurelia" and Property_type = "Entire Apartment" and Room_type = "Entire place" ),

Aurelia_cumulative_review_count as (Select listing_id,
bedrooms, accommodates,amenities,
price, review_scores_rating,
review_count,
row_number() over(order by review_count desc) as review_count_rank,
sum(review_count) over(order by review_count desc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as review_count_cumulative,
Round(100*(sum(review_count) over(order by review_count desc)/sum(review_count) over()),2) as running_percentage
FROM Aurelia_rating)

Select * from Aurelia_cumulative_review_count where running_percentage<81
 ;


