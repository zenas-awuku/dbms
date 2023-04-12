select * 
from pubs2.titles
where price is null 


select title, price,
case
	when price is null then cast(20 as money)
end as "New Price"
from pubs2.titles
where price is null

select title_id ,price, coalesce (price,cast(20 as money)) from pubs2.titles where price is null;


select substring(pr_info,1,50) from pubs2.pub_info;

SELECT LEFT(pr_info, 50) FROM pubs2.pub_info;

SELECT RIGHT(pr_info, 50) FROM pubs2.pub_info;


select convert(varchar(20), pubdate, 9)
from pubs2.titles

select to_char(pubdate, 'Day, DD  HH12:MI:SS')
from pubs2.titles

SELECT title, to_char(pubdate, 'DAY, dd MONTHyyyy')
FROM pubs2.titles;

SELECT ord_date, to_char(ord_date, 'ddth MONTHyyyy')
FROM pubs2.sales;

SELECT COUNT(*) FROM pubs2.sales

to_date(ord_date)

update pubs2.sales
set ord_date = to_char(to_date(ord_date, 'YYY-MM-DD'), 'DAY ddth Month yyyy')


