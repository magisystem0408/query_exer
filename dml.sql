create temp function start_date() as (date(2010,1,1));
create temp function end_date() as (date(2020,8,31));


select
    date_trunc(date(creation_date), month) as q_month
    ,sum(view_count) as pv
from `bigquery-public-data.stackoverflow.posts_questions`

where date(creation_date) between start_date() and end_date()
group by q_month
order by q_month;

