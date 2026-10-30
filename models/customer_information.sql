-- select c_custkey,
--        c_name,
--        c_phone,
--        case 
--            when c_mktsegment='MACHINERY' then 'Industrial'
--            when c_mktsegment='BUILDING'  then 'Construction'
--            when c_mktsegment='AUTOMOBILE' then 'Automotive' 
--            when c_mktsegment='HOUSEHOLD'  then 'Consumer Goods'
--            when c_mktsegment='FURNITURE'  then 'Home Furnishing'
--            else 'other' 
--         end c_mktsegment
-- from {{ source('s1', 'customer_information') }} ;


-- SELECT
--     c_custkey,
--     c_name,
--     c_phone,
--     CASE
--         WHEN c_mktsegment = 'MACHINERY'  THEN 'Industrial'
--         WHEN c_mktsegment = 'BUILDING'   THEN 'Construction'
--         WHEN c_mktsegment = 'AUTOMOBILE' THEN 'Automotive'
--         WHEN c_mktsegment = 'HOUSEHOLD'  THEN 'Consumer Goods'
--         WHEN c_mktsegment = 'FURNITURE'  THEN 'Home Furnishing'
--         ELSE 'Other'
--     END AS market_segment
-- FROM {{ source('s1', 'customer_information') }}

-- # but i dont want to crate this as view i want to create as table. so i will use config macro

-- 

-- SELECT
--     c_custkey,
--     c_name,
--     c_phone,
--     CASE
--         WHEN c_mktsegment = 'MACHINERY'  THEN 'Industrial'
--         WHEN c_mktsegment = 'BUILDING'   THEN 'Construction'
--         WHEN c_mktsegment = 'AUTOMOBILE' THEN 'Automotive'
--         WHEN c_mktsegment = 'HOUSEHOLD'  THEN 'Consumer Goods'
--         WHEN c_mktsegment = 'FURNITURE'  THEN 'Home Furnishing'
--         ELSE 'Other'
--     END AS market_segment
-- FROM {{ source('s1', 'customer_information') }}



-- - in Snowfklakre we observed that this query will drop the view automatically and created table with same name.
-- suppose i have a view  created in dbt which is reflected in snowflake database and the  if i created the 
-- same query and created  table  with config macro where we mention materializesation is table then this view
--  created before will drop automatically and save this trable in tables
-- adapter: Dropping relation "DEV_DB"."SILVER"."CUSTOMER_INFORMATION" because it is a view and target relation dev_db.silver.customer_information is of type table.

-- now we are using here macro called 'c_mktsegment'
{{
    config(
        materialized='table'
    )
}}

SELECT
    c_custkey,
    c_name,
    c_phone,
    {{ c_mktsegment('c_mktsegment') }}
FROM {{ source('s1', 'customer_information') }}





































