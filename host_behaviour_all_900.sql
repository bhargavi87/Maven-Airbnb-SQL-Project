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
 count(a.listing_id) as num_listings,

 100*Sum(case when host_identity_verified= 't' then 1 else 0 end)/ count(a.listing_id) as percentage_host_verified,
 sum(case when host_response_time= 'a few days or more' then 1 else 0 end ) as avg_host_response_time,
 avg(host_response_rate) as avg_host_response_rate,
 avg(host_acceptance_rate) as avg_host_acceptance_rate,
 avg(maximum_nights) as max_nights,
 avg(minimum_nights) as min_nights,
  sum(case when instant_bookable = 't' then 1 else 0 end) as percentage_instant_bookable,
  
  avg(Review_scores_rating) as overall_review_rating,
  avg(Review_scores_accuracy) as overall_accuracy_rating,
  avg(Review_scores_cleanliness) as overall_cleanliness_rating,
  avg(Review_scores_communication) as overall_communication_rating,
  avg(Review_scores_value) as overall_value_rating
 from
 Listing_review_count_room a
 
 where host_is_superhost = 't' and neighbourhood = 'XIII Aurelia'  and property_type = 'Entire Apartment'
 group by a.neighbourhood, host_is_superhost
 
  UNION
 select 
  a.neighbourhood,
 host_is_superhost,
 count(a.listing_id) as num_listings,

 100*Sum(case when host_identity_verified= 't' then 1 else 0 end)/ count(a.listing_id) as percentage_host_verified,
 sum(case when host_response_time= 'a few days or more' then 1 else 0 end) as avg_host_response_time,
 avg(host_response_rate) as avg_host_response_rate,
 avg(host_acceptance_rate) as avg_host_acceptance_rate,
 avg(maximum_nights) as max_nights,
 avg(minimum_nights) as min_nights,
  Sum(case when instant_bookable = 't' then 1 else 0 end)/ count(a.listing_id) as percentage_instant_bookable,
  avg(Review_scores_rating) as overall_review_rating,
  avg(Review_scores_accuracy) as overall_accuracy_rating,
  avg(Review_scores_cleanliness) as overall_cleanliness_rating,
  avg(Review_scores_communication) as overall_communication_rating,
  avg(Review_scores_value) as overall_value_rating
 from
 Listing_review_count_room a
 
 where host_is_superhost = 'f' and neighbourhood = 'XIII Aurelia' and property_type = 'Entire Apartment'
 group by a.neighbourhood, host_is_superhost
 

 ;
