select * from dev_db.bronze.emp
where job={{ var('v_job') }} and deptn0={{ var('v_deptno') }}