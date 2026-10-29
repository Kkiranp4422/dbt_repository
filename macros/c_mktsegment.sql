{% macro c_mktsegment(c1) %}

    CASE
        WHEN {{ c1 }} = 'MACHINERY' THEN 'Industrial'
        WHEN {{ c1 }} = 'BUILDING' THEN 'Construction'
        WHEN {{ c1 }} = 'AUTOMOBILE' THEN 'Automotive'
        WHEN {{ c1 }} = 'HOUSEHOLD' THEN 'Consumer Goods'
        WHEN {{ c1 }} = 'FURNITURE' THEN 'Home Furnishing'
        ELSE 'Other' 
    end c_mktsegment
    

{% endmacro %}

-- here we created macro'c_mktsegment' and input parametr is c1 

