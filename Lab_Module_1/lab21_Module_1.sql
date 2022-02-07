 ----- Challenge 1 - Who Have Published What At Where?----

SELECT authors.au_id as author_id, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, titles.title as TITLE,  publishers.pub_name as PUBLISHER_NAME
FROM  authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id;
 
---- -- Challenge 2 - Who Have Published How Many At Where?--
select authors.au_id as a_i, authors.au_fname as F_Name, authors.au_lname as S_Name, count(publishers.pub_name)as Pub
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id
group by a_i, F_Name, S_Name;
select count(*)
from titleauthor;

----- Challenge 3 - Best Selling Authors ---

select authors.au_id as a_i, authors.au_fname as F_Name, authors.au_lname as S_Name, ytd_sales as sales
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id
order by sales desc limit 3;

-------- Challenge 4 - Best Selling Authors -----
select authors.au_id as a_i, authors.au_fname as F_Name, authors.au_lname as S_Name, titles.ytd_sales as sales 
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id
where sales is not null
order by sales desc  







