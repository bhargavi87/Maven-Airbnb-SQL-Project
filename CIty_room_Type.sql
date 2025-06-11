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
price , 
Review_scores_rating,
 COALESCE(rc.num_of_reviews,0) as review_count
 from listings_all l left join review_count rc on l.listing_id = rc.rc_listing_id),

-- Listings and review score by room for NY and Rome
Rome_NY_rooms as(Select * from  Listing_review_count_room
Where city IN ( "Rome", "New York")),



-- Avg rating and total reviews , price by room type
Rome_NY_room_summary as(Select 
city, 
room_type,
Count(listing_id) as num_listing,
avg(accommodates) as people_canStay,
avg(price) as avg_room_price , 
sum(review_count) as total_reviews,
avg(Review_scores_rating) as Avg_Review_rating
FROM Rome_NY_rooms
group by 1,2
order by 1,2),


-- select * from Rome_NY_room_summary;
-- pivoted summary of total review and avg rating by room for NY and Rome
Review_rating_byRoom_pivot as (Select

room_type,
sum(Case When City = "New York" then people_canStay else 0 end) as NY_total_accommodates,
sum(Case When City = "Rome" then people_canStay else 0 end) as Rome_total_accommodates,
sum(Case When City = "New York" then num_listing else 0 end) as NY_num_listing,
sum(Case When City = "Rome" then num_listing else 0 end) as Rome_num_listing,
sum(Case When City = "New York" then total_reviews else 0 end) as NY_total_reviews,
sum(Case When City = "Rome" then total_reviews else 0 end) as Rome_total_reviews,
sum(Case When City = "New York" then Avg_Review_rating else 0 end) as NY_reviews_rating,
sum(Case When City = "Rome" then Avg_Review_rating else 0 end) as Rome_reviews_rating,
sum(Case When City = "New York" then avg_room_price else 0 end) as NY_avg_price,
sum(Case When City = "Rome" then avg_room_price*1.14 else 0 end) as Rome_avg_price
 
 from Rome_NY_room_summary
 
 group by room_type
 order by 1)
 
 Select * from Review_rating_byRoom_pivot;
 

  
