

{% snapshot t_ticket_status %}
    {{
        config(
            target_schema='silver',
            target_database='dev_db',
            unique_key='id',
            strategy='check',
            check_cols=['status']
        )
    }}

    select * from {{ source('s1', 't_ticket_track') }}
 {% endsnapshot %}