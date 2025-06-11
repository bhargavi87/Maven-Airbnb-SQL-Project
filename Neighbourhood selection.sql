Use bm_maven_project;


-- Review count by date
With review_Count as (select listing_id as rc_listing_id ,count(review_id) as num_of_reviews from reviews
group by listing_id), 

-- Listings and review score by room type

Listing_review_count_room as (select city,
listing_id,
room_type,
property_type,
bedrooms,
accommodates,
neighbourhood,
price*1.14 as Rome_price , 
Review_scores_rating,
 COALESCE(rc.num_of_reviews,0) as review_count
 from listings_all l left join review_count rc on l.listing_id = rc.rc_listing_id),

-- Listings and review score by room for aprtments in Rome
Rome_rooms as(Select * from  Listing_review_count_room
Where city ="Rome" and Property_type = "Entire Apartment" and Room_type = "Entire place" ),



-- Avg rating and total reviews , price by neighbourhood
Rome_room_summary as(Select 
city, 
room_type,
property_type,
neighbourhood,
Count(listing_id) as num_listing,
avg(accommodates) as people_canStay,
avg(Rome_price) as avg_room_price , 
sum(review_count) as total_reviews,
avg(Review_scores_rating) as Avg_Review_rating
FROM Rome_rooms
group by 1,2,3,4
order by 1,4)


select * from Rome_room_summary;


 

  
