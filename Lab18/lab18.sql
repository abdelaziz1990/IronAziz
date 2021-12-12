create database appelstore;
use appelstore;
select * from applestore;
-- 1. What are the different genres?;
select count(*),prime_genre from applestore group by prime_genre;
-- 2. Which is the genre with the most apps rated?
select prime_genre, count(prime_genre) as genre,rating_count_tot from applestore group by rating_count_tot desc limit 1;
-- 3. Which is the genre with most apps?
select sum(track_name) as su  ,prime_genre from applestore group by prime_genre order by su desc limit 1;
-- 4. Which is the one with least?
select sum(track_name) as su  ,prime_genre from applestore group by prime_genre order by su asc limit 1;
-- 5. Find the top 10 apps most rated.
select track_name, rating_count_tot from applestore order by rating_count_tot desc limit 10;
-- 6. Find the top 10 apps best rated by users.
select track_name , user_rating_ver from applestore group by user_rating_ver desc limit 10;
-- 7. Take a look at the data you retrieved in question 5. Give some insights.
-- social media was the best rating betwenthe others apps, Facebook was the most rated one
-- 8. Take a look at the data you retrieved in question 6. Give some insights.
-- am surprised by bible rating here....
-- 9. Now compare the data from questions 5 and 6. What do you see?
-- no coherence the two results the most rated was not the best rated !!!!
-- 10. How could you take the top 3 regarding both user ratings and number of votes?
-- for me no relationship between the two data.
-- 















