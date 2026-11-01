--=======================================================================
-- topic 07|Snapshot(SCD Type 2)
-- concept : Snpashot config,strategy =check,time travel on data
--======================================================================

{% snapshot snap_member_enrollment %}
    {{
        config(
            target_schema='schema',
            target_database='database',
            unique_key='member_id',
            strategy='check',
            invalidate_hard_deletes=False,
            updated_at='plan_id','termination_date','is_active'
        )
    }}

    select * from {{ source('source_name', 'object_name') }}
 {% endsnapshot %}






