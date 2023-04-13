-- Join the publishers and pub_info and show the publisher name and the first 40 characters of the pr_info information.
select pub_name, left(pub_info.pr_info, 40)
from publishers inner join pub_info
	on publishers.pub_id = pub_info.pub_id;




	
-- Join the publishers and titles tables to show all titles published by each publisher. Display the pub_id, pub_name and title_id.
select p.pub_id ,pub_name, t.title_id
from publishers p left outer join titles t 
	on p.pub_id = t.pub_id;




select p.pub_id ,pub_name, t.title_id, t.title
from publishers p left outer join titles t 
	on p.pub_id = t.pub_id;

--For each title_id in the table titles, rollup the corresponding qty in sales and show: title_id, title, ord_num and the rolled-up value as a column aggregate called Total Sold
select t.title_id, s.qty, t.title, s.ord_num
from titles t left outer join sales s
	on t.title_id = s.title_id
order by s.ord_num;
	
select t.title_id,  t.title, s.ord_num, sum(s.qty) as "Total Sold"
from titles t left outer join sales s
	on t.title_id = s.title_id
group by t.title_id, s.ord_num;

select *
from sales s2
order by ord_num;

-- For each stor_id in stores, show the corresponding ord_num in sales and the discount type from table discounts. The output should consist of three columns: ord_num, discount and discounttype and should be sorted on ord_num
select s.stor_id, s.stor_name, sa.ord_num, d.discount, d.discounttype
from stores s left outer join sales sa
	on s.stor_id = sa.stor_id
		left outer join discounts d 
			on s.stor_id = d.stor_id;
			
select sa.ord_num, d.discount, d.discounttype
from stores s left outer join sales sa
	on s.stor_id = sa.stor_id
		inner join discounts d 
			on s.stor_id = d.stor_id
order by sa.ord_num desc;


-- Show au_lname from authors, and pub_name from publishers when both publisher and author live in the same city.
select a.au_lname, p.pub_name, a.city
from authors a inner join titleauthor t
	on a.au_id = t.au_id
		inner join titles t2 
			on t.title_id = t2.title_id
				inner join publishers p 
					on a.city = p.city;
				
select a.au_lname, p.pub_name
from publishers p inner join authors a
	on p.city = a.city
		inner join titles t 
			on t.pub_id = p.pub_id;

		
select a.au_lname, a.au_fname, t.title, p.pub_name
from publishers p inner join authors a
	on p.city = a.city
		inner join titles t 
			on t.pub_id = p.pub_id;
--group by a.au_lname, p.pub_name;
				
select a.*, t.*, t2.*, p.*
from authors a inner join titleauthor t
	on a.au_id = t.au_id
		inner join titles t2 
			on t.title_id = t2.title_id
				inner join publishers p
					on t2.pub_id = p.pub_id;

-- Refine 5 so that for each author you show all publishers who live in the same city and have published one of the authors titles.
select a.au_lname, p.pub_name, a.city
from authors a inner join titleauthor t
	on a.au_id = t.au_id
		inner join titles t2 
			on t.title_id = t2.title_id
				inner join publishers p 
					on a.city = p.city and t2.pub_id = p.pub_id;
				

select a.au_lname, a.au_fname, t2.title, p.pub_name, a.city
from authors a inner join titleauthor t 
	on a.au_id = t.au_id
		inner join titles t2 
			on t.title_id = t2.title_id
				inner join publishers p 
					on t2.pub_id = p.pub_id;
				

-- Refine 1 so that an outer join is performed. All of the publishers from the first table should be shown, not just those with pr_info information in pub_info. You should use the ANSI SQL92 syntax.
select pub_name, left(pub_info.pr_info, 40)
from publishers left outer join pub_info
	on publishers.pub_id = pub_info.pub_id;



-- List each publisher's name, the title of each book they have sold and the total quantity of that title.
select p.pub_name, t.title, sum(s.qty)
from publishers p left outer join titles t
	on p.pub_id = t.pub_id
		inner join sales s 
			on t.title_id = s.title_id
group by p.pub_name, t.title
order by pub_name;

-- 
select p.pub_name, t.title
from publishers p left outer join titles t 
	on p.pub_id = t.pub_id;

select p.pub_name, count(t.title)
from publishers p left outer join titles t 
	on p.pub_id = t.pub_id
group by p.pub_name;



