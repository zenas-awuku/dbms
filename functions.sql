-- Show current time and current timestamp
select current_time
select current_timestamp 


-- Converting from Strings to date and timestamp
select to_date('2018-09-26', 'YYYY-MM-DD')
select to_timestamp('2018-09-26', 'YYYY-MM-DD HH:MI:SS')
SELECT TO_TIMESTAMP('2017-03-31 9:30:20', 'YYYY-MM-DD HH:MI:SS');

-- Subtracting dates
select age('2018-12-25', '2018-09-26')

select cast('2018-12-25' as date)-cast('2018-09-26' as date) as "Days"


-- How many days have elapsed since each book in TITLES was published
select title,to_char(pubdate, 'DAY, DDth Month YYYY'), age(current_date, pubdate)
from pubs2.titles

select title,to_char(pubdate, 'DAY, DDth Month YYYY'), current_date-pubdate as "Days Past By Subtraction", age(current_date, pubdate) as "With age function"
from pubs2.titles

-- Extracting components from dates
-- Display the year of publication of each book in TITLES.
select title, to_char(pubdate, 'DAY, DDth Month YYYY'), extract (year from pubdate)
from pubs2.titles;

-- Display the day of publication of each book in TITLES.
select title, to_char(pubdate, 'DAY, DDth Month YYYY'), extract (day from pubdate) as day, extract (month from pubdate) as month, extract (year from pubdate) as year
from pubs2.titles;


-- In a SELECT-statement, add the difference between 2011-01-01 and the current date to the sales date field in the sales table.
select ord_date, to_char(age(current_date,'2011-01-01')+ord_date, 'dd-mm-yy') as "Using AGE function", to_char(current_date-'2011-01-01'+ord_date, 'dd-mm-yy') as "New date by Subtracting" 
from pubs2.sales

-- Show how many days remain between now and Thanksgiving and/or Christmas and/or New Years Day.



--Show how old you are as a number of days - you don't have to be too honest about your year of birth if you are over 25 
select extract(month from age(current_date, '1992-04-23'))

select current_date - '2021-04-13'


-- For each of the publication dates in titles, display the difference between the pubdate and the current date in days as an integer.
select title, cast(current_date - pubdate as numeric) as "Days Ago"
from pubs2.titles

-- From the sales table convert the date field to dd/mm/yy format
select ord_date , to_char(ord_date, 'dd/mm/yy') as "New Format"
from pubs2.sales 


-- select from the sales table stor_id for sales on your birthday in "dd/mm/yy" format. If there are none, then pick sales for the date nearest to your birthdate. Search again for before your birthday.



-- Study the reference documents for your DBMS and then display each book title with its publication date converted to the correct format for each of the following regions: USA, UK, Japan


-- Show the first word of each title
select left (title, 1)
from pubs2.titles;


-- Print the number of characters which could be added to each of the values in the title field before the data is truncated. You can find the title column's length using the system commands for your DBMS.
select title, length(title)
from pubs2.titles
