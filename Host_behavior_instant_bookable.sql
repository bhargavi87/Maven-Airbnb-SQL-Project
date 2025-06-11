Use bm_maven_project;
With review_Count as (select listing_id as rc_listing_id ,count(review_id) as num_of_reviews from reviews
group by listing_id), 

-- Listings and review score by room type

Listing_review_count_room as (select city,
listing_id,
host_since,
host_is_superhost,
host_identity_verified,
host_response_rate,
host_response_time,
host_acceptance_rate,
host_has_profile_pic,
maximum_nights,
minimum_nights,
instant_bookable,
room_type,
property_type,
bedrooms,
accommodates,
neighbourhood,
price , 
Review_scores_rating,
review_scores_accuracy,
review_scores_cleanliness,
review_scores_checkin,
review_scores_communication,
review_scores_location,
review_scores_value,
 COALESCE(rc.num_of_reviews,0) as review_count
 from listings_all l left join review_count rc on l.listing_id = rc.rc_listing_id)
 
 select 
  a.neighbourhood,
 host_is_superhost,
 instant_bookable,
 count(b.listing_id) as num_listings
 
 from
 Listing_review_count_room a
 inner join 
 aurelia_top_listing b
 on a.listing_id = b.listing_id

 group by a.neighbourhood, host_is_superhost,  instant_bookable
 

 

 ;
