-- Get average prices from the titles table for each type of book, and convert type to char(30)
select type::char(30), avg(cast(price as numeric))::money
from pubs2.titles
group by type

-- Print the difference between (to a resolution of days) the earliest and latest publication date in titles
select max(pubdate) - min(pubdate)
from pubs2.titles


select age(max(pubdate), min(pubdate)) 
from pubs2.titles 

-- Print the average, min and max book prices within the titles table organised into groups based on type and publisher id.
select type, pub_id, min(price), max(price), avg(price::numeric)
from pubs2.titles
group by type, pub_id 

select * from pubs2.titles 

-- Refine the previous question to show only those types whose average price is > $20 and output the results sorted on the average price
select type, pub_id, min(price), max(price) as "Max Price", avg(price::numeric)::money as "Avg Price"
from pubs2.titles
group by type, pub_id 
having avg(price::numeric) > 20
order by "Avg Price"

--List the books in order of the length of their title
select title, length(title) as count 
from pubs2.titles
order by length(title)

select title, char_length(title) as count 
from pubs2.titles
order by char_length(title)

-- Business Queries
-- What is the average age in months of each type of title?
select type, current_date - pubdate
from pubs2.titles



--select type, avg(DATE_PART('month', current_date::timestamp - pubdate::timestamp)::numeric) AS "DATE_DIFF"
--from pubs2.titles
--group by type

select type, avg()


-- How many authors live in each city?
select city, count(city)
from pubs2.authors
group by city
order by city

-- What is the longest title?
select max(length(title))  from pubs2.titles

select title, length(title)
from pubs2.titles 
order by length(title) desc

select title, length(title)
from pubs2.titles
--group by title
order by length(title) desc, title
limit 1

-- How many books have been sold by each store and how many books have been sold in total?
select stor_id, count(qty) as "Quantity Sold by Store", sum(qty) as "Total Books Sold"
from pubs2.sales
group by stor_id

select * 
from pubs2.sales



