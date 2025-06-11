select listing_id, amenities from listings_all;
-- Finding the max length of amenities array
select
(length(amenities)- length(replace(amenities,",",''))+1) as array_length,
count(b.listing_id) as num_listings
from listings_all a
inner join 
aurelia_top_listing b
on a.listing_id = b.listing_id
group by 1
order by 2 desc;



