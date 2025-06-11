Use bm_maven_project;
-- Select * from listings_all;
-- Location analysis by review scores and review count
-- average review score
With review_count as (select listing_id,count(review_id) as num_of_reviews from reviews
group by listing_id),

-- average review score
listing_wit_reviews as (select l.listing_id, city, review_scores_rating, price,
 COALESCE(rc.num_of_reviews,0) as review_count 
 from listings_all l left join review_count rc on l.listing_id = rc.listing_id)
 
 select * from listing_wit_reviews where city <> "Paris";
-- review count by listing
/*With review_count as (select listing_id,count(review_id) as num_of_reviews from reviews
group by listing_id),

-- average review score
listing_wit_reviews as (select l.listing_id, city, review_scores_rating, price,
 COALESCE(rc.num_of_reviews,0) as review_count 
 from listings_all l left join review_count rc on l.listing_id = rc.listing_id),

 -- aggregating by city
 city_aggregation as (select city,
 count(listing_id) as num_listings,
 avg(price) as avg_pricing,
 avg(review_scores_rating) as avg_rating,
 avg(review_count) as total_reviews
 from listing_wit_reviews
 group by city)
 
 select * from city_aggregation;
 
 -- final summary of review count, review rating by city
 /*select 
 city,
 num_listings,
 avg_pricing,
 avg_rating,
 total_reviews
 from city_aggregation
 order by avg_rating desc, total_reviews desc
 LIMIT 10;*/
