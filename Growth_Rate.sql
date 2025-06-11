Use bm_maven_project;


-- Review count by date
With review_Count_trend as (select listing_id as rct_listing_id, Review_Date ,count(review_id) as num_of_reviews from reviews
group by listing_id,Review_Date), 

-- Listings and review score by date

Listing_review_count_trend as (select listing_id,listing_name,neighbourhood,city,
Review_scores_rating,
 COALESCE(rct.num_of_reviews,0) as review_count ,
 Review_Date
 from listings_all l left join review_count_trend rct on l.listing_id = rct.rct_listing_id),

-- Listings and review score by date for NY and Rome
Rome_NY_ratings as(Select * from  Listing_review_count_trend
Where city IN ( "Rome", "New York")),

-- Avg rating and total reviews by date
Rome_NY_ratings_summary as(Select city, Extract(Year from Review_date) as Review_Yr,
sum(review_count) as total_reviews,
avg(Review_scores_rating) as Avg_Review_rating
FROM Rome_NY_ratings
group by 1,2),

-- pivoted summary of total review and avg rating for NY and Rome
Review_rating_pivot as (Select
Review_Yr,
sum(Case When City = "New York" then total_reviews else 0 end) as NY_total_reviews,
sum(Case When City = "Rome" then total_reviews else 0 end) as Rome_total_reviews
 
 from Rome_NY_ratings_summary
 
 group by Review_Yr
 order by 1),
 
-- Select Review_Yr from Review_rating_pivot;
 lag_review_count as (Select 
 Review_Yr,
 NY_total_reviews,
 LAG(NY_total_reviews) OVER (wf1) as LY_NY_Review_Count,
 
 Rome_total_reviews,
  LAG(Rome_total_reviews) OVER (wf1) as LY_Rome_Review_Count
 from Review_rating_pivot
  window wf1 as (Order by Review_Yr))
  
  select 
   Review_Yr,
 NY_total_reviews,
 LY_NY_Review_Count,
( (NY_total_reviews-LY_NY_Review_Count)/LY_NY_Review_Count)*100 as NY_growth_percentage,
Rome_total_reviews,
LY_Rome_Review_Count,
((Rome_total_reviews-LY_Rome_Review_Count)/LY_Rome_Review_Count)*100 as Rome_growth_percentage
  from lag_review_count ;
 
 
 