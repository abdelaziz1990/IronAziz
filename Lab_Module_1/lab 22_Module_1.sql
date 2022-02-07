----- Challenge 1 - Most Profiting Authors----
----- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication ------

select titleauthor.au_id, titles.title_id, round(titles.advance * titleauthor.royaltyper / 100,2) as advance, 
round(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100,2) as sales_royalty 
from titleauthor 
join  titles 
on titles.title_id = titleauthor.title_id
join sales
on sales.title_id = titleauthor.title_id;

----- Step 2,3: Aggregate the total royalties for each title and author, Calculate the total profits of each author -----
select 
   au_id,(su+advancee) as profits, title_id
from (select au_id,title_id, sum(z.sales_royalty) as su, advancee from(
select titleauthor.au_id, titles.title_id, round(titles.advance * titleauthor.royaltyper / 100,2) as advancee, 
round(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100,2) as sales_royalty 
from titleauthor 
left join  titles 
on titles.title_id = titleauthor.title_id
 left join sales
on sales.title_id = titleauthor.title_id
) z
group by au_id
)
  t 
group by au_id, profits
order by profits;
----- Challenge 2 - Alternative Solution ------

create temporary table ch1
select titleauthor.au_id, titles.title_id, round(titles.advance * titleauthor.royaltyper / 100,2) as advance, 
round(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100,2) as sales_royalty 
from titleauthor 
join  titles 
on titles.title_id = titleauthor.title_id
join sales
on sales.title_id = titleauthor.title_id;

select * from ch1; 

create temporary table ch3_2 
select 
   au_id,(su+advancee) as profits, title_id
from (select au_id,title_id, sum(z.sales_royalty) as su, advancee from(
select titleauthor.au_id, titles.title_id, round(titles.advance * titleauthor.royaltyper / 100,2) as advancee, 
round(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100,2) as sales_royalty 
from titleauthor 
left join  titles 
on titles.title_id = titleauthor.title_id
 left join sales
on sales.title_id = titleauthor.title_id
) z
group by au_id
)
  t 
group by au_id, profits
order by profits;

select * from ch3_2;

-------- Challenge 3 ----

CREATE TABLE most_profiting_authors
SELECT au_id, (sales_royalty + advancee) as profits
FROM ch3_2
GROUP BY au_id, profits
ORDER BY profits


