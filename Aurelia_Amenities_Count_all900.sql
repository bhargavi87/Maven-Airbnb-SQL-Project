Use bm_maven_project;
with Aurelia_amenities_array_split as (SELECT
  a.listing_id,
  TRIM(SUBSTRING_INDEX(amenities, ',', 1)) AS amenity_1,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 2), ',', -1)) AS amenity_2,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 3), ',', -1)) AS amenity_3,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_4,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_5,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_6,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_7,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_8,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_9,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_10,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_11,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_12,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_13,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_14,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_15,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_16,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_17,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_18,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_19,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_20,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_21,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_22,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_23,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_24,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_25,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_26,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_27,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_28,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_29,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_30,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_31,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_32,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_33,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_34,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_35,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_36,
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(amenities, ',', 4), ',', -1)) AS amenity_37
  FROM listings_all a where neighbourhood="XIII Aurelia"
  ),

  aurelia_amenity_union as(
  Select listing_id,amenity_1 as amenity from Aurelia_amenities_array_split where amenity_1 is not null
  UNION ALL
   Select listing_id,amenity_2 from Aurelia_amenities_array_split where amenity_2 is not null
  UNION ALL
   Select listing_id,amenity_3 from Aurelia_amenities_array_split where amenity_3 is not null
  UNION ALL
   Select listing_id,amenity_4 from Aurelia_amenities_array_split where amenity_4 is not null
  UNION ALL
   Select listing_id,amenity_5 from Aurelia_amenities_array_split where amenity_5 is not null
  UNION ALL
   Select listing_id,amenity_6 from Aurelia_amenities_array_split where amenity_6 is not null
  UNION ALL 
  Select listing_id,amenity_7 from Aurelia_amenities_array_split where amenity_7 is not null
  UNION ALL
   Select listing_id,amenity_8 from Aurelia_amenities_array_split where amenity_8 is not null
  UNION ALL
   Select listing_id,amenity_9 from Aurelia_amenities_array_split where amenity_9 is not null
  UNION ALL
   Select listing_id,amenity_10 from Aurelia_amenities_array_split where amenity_10 is not null
  UNION ALL
   Select listing_id,amenity_11 from Aurelia_amenities_array_split where amenity_11 is not null
  UNION ALL
   Select listing_id,amenity_12 from Aurelia_amenities_array_split where amenity_12 is not null
  UNION ALL
   Select listing_id,amenity_13 from Aurelia_amenities_array_split where amenity_13 is not null
  UNION ALL
   Select listing_id,amenity_14 from Aurelia_amenities_array_split where amenity_14 is not null
  UNION ALL
   Select listing_id,amenity_15 from Aurelia_amenities_array_split where amenity_15 is not null
  UNION ALL
   Select listing_id,amenity_16 from Aurelia_amenities_array_split where amenity_16 is not null
  UNION ALL
   Select listing_id,amenity_17 from Aurelia_amenities_array_split where amenity_17 is not null
  UNION ALL
   Select listing_id,amenity_18 from Aurelia_amenities_array_split where amenity_18 is not null
  UNION ALL
   Select listing_id,amenity_19 from Aurelia_amenities_array_split where amenity_19 is not null
  UNION ALL
   Select listing_id,amenity_20 from Aurelia_amenities_array_split where amenity_20 is not null
  UNION ALL
   Select listing_id,amenity_21 from Aurelia_amenities_array_split where amenity_21 is not null
  UNION ALL
   Select listing_id,amenity_22 from Aurelia_amenities_array_split where amenity_22 is not null
  UNION ALL
   Select listing_id,amenity_23 from Aurelia_amenities_array_split where amenity_23 is not null
  UNION ALL
   Select listing_id,amenity_24 from Aurelia_amenities_array_split where amenity_24 is not null
  UNION ALL
   Select listing_id,amenity_25 from Aurelia_amenities_array_split where amenity_25 is not null
  UNION ALL
   Select listing_id,amenity_26 from Aurelia_amenities_array_split where amenity_26 is not null
  UNION ALL
   Select listing_id,amenity_27 from Aurelia_amenities_array_split where amenity_27 is not null
  UNION ALL
   Select listing_id,amenity_28 from Aurelia_amenities_array_split where amenity_28 is not null
  UNION ALL
   Select listing_id,amenity_29 from Aurelia_amenities_array_split where amenity_29 is not null
  UNION ALL
   Select listing_id,amenity_30 from Aurelia_amenities_array_split where amenity_30 is not null
  UNION ALL
   Select listing_id,amenity_31 from Aurelia_amenities_array_split where amenity_31 is not null
  UNION ALL
   Select listing_id,amenity_32 from Aurelia_amenities_array_split where amenity_32 is not null
  UNION ALL
   Select listing_id,amenity_33 from Aurelia_amenities_array_split where amenity_33 is not null
  UNION ALL
   Select listing_id,amenity_34 from Aurelia_amenities_array_split where amenity_34 is not null
  UNION ALL
   Select listing_id,amenity_35 from Aurelia_amenities_array_split where amenity_35 is not null
  UNION ALL
   Select listing_id,amenity_36 from Aurelia_amenities_array_split where amenity_36 is not null
  UNION ALL
   Select listing_id,amenity_37 from Aurelia_amenities_array_split where amenity_37 is not null),
   
   Aurelia_amenity_unpivot as (select listing_id,
   TRIM(Replace(REplace(Replace(amenity, '"',''),"[",''),"]",'')) as amenity_clean
   from aurelia_amenity_union)
   
   
   Select amenity_clean,
   count(distinct listing_id) as num_aurelia_lsiting
   from Aurelia_amenity_unpivot
  group by amenity_clean
  order by 2 desc
  
  ;
  
  
