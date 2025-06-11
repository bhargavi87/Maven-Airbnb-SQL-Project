Use bm_maven_project;
-- Select * from listings_all;
-- Location analysis by review scores and review count
-- average review score
-- review count by listing
-- create temporary table listing_wit_reviews as 
-- (With review_count as (select listing_id as rc_listing_id, Review_Date ,count(review_id) as num_of_reviews from reviews
-- group by listing_id)

-- Review count by date
With review_Count_trend as (select listing_id as rct_listing_id, Review_Date ,count(review_id) as num_of_reviews from reviews
group by listing_id,Review_Date), 

-- average review score by date

Listing_review_count_trend as (select listing_id,listing_name,neighbourhood,city,
Review_scores_rating,
 COALESCE(rct.num_of_reviews,0) as review_count ,
 Review_Date
 from listings_all l left join review_count_trend rct on l.listing_id = rct.rct_listing_id),

Rome_NY_ratings as(Select * from  Listing_review_count_trend
Where city IN ( "Rome", "New York")),

Rome_NY_ratings_summary as(Select city, Extract(Year_Month from Review_date) as Review_Yr_Month,
sum(review_count) as total_reviews,
avg(Review_scores_rating) as Avg_Review_rating
FROM Rome_NY_ratings
group by 1,2)


Select
Review_Yr_Month,
sum(Case When City = "New York" then total_reviews else 0 end) as NY_total_reviews,
sum(Case When City = "Rome" then total_reviews else 0 end) as Rome_total_reviews,
 avg(Case when city = "New York" then Avg_Review_rating else null End) as NY_avg_overall_rating,
  avg(Case when city = "Rome" then Avg_Review_rating else null End) as Rome_avg_overall_rating 
 from Rome_NY_ratings_summary
 
 group by Review_Yr_Month
 order by 1;
 