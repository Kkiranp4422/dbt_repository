{{
    config(
        materialized='incremental',
        unique_key='empno',
          on_schema_change='append_new_columns'
    )
}}

select * from {{ source('s1', 's_emp') }}


{%if is_incremental()%}
where d_upd_Date>(select max(d_upd_Date) from {{this}})
{%endif%}