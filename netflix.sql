-- 1. Count the number of Movies vs TV Shows

select type , count(type) as Type_count
from Netflix
group by type

-- 2. Find the most common rating for movies and TV shows

select top 4 type , rating , count(rating) as c
from Netflix
group by type , rating
order by c desc


-- 3. List all movies released in a specific year (e.g., 2020)
select *
from Netflix
where release_year = '2020' and type = 'movie'

-- 4. Find the top 5 countries with the most content on Netflix

select top 5 country , count(*) as number_of_content
from Netflix
where country is not null
group by country
order by number_of_content desc

-- 5. Identify the longest movie
select top 1 title as the_longest_movie
from Netflix
where type = 'movie'
order by duration



-- 6. Find content added in the last 5 years
select *
from Netflix
where YEAR(date_added) in (2024,2023,2022,2021,2020)

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select * from (
select * , LTRIM(RTRIM(value)) as dir_name
from Netflix
cross apply string_split(director , ',')
) as t
where dir_name = 'Rajiv Chilaka'

-- 8. List all TV shows with more than 5 seasons

select title , duration 
from Netflix
where type = 'tv show'
and TRY_CAST(LEFT(duration,CHARINDEX(' ',duration)-1)as INT) >5 


-- 9. Count the number of content items in each genre

select genre , count(*) as genre_count
from (
select value as genre
from Netflix
cross apply string_split(listed_in , ',')
) as t
group by genre
order by genre_count desc


--10 return top 5 year with the highest number of content release by India on netflix. 
select top 5 count(show_id) as content_count , release_year
from Netflix
where country = 'india'
group by release_year
order by content_count desc

-- 11. List all movies that are documentaries

select *
from Netflix
where listed_in like '%Documentaries%' and type = 'movie'

-- 12. Find all content without a director

select *
from Netflix
where director is null

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

select count(*) as movies_count
from Netflix
where cast like '%Salman Khan%' and release_year >= year(GETDATE()) - 10
 
 -- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

 select top 10 value as actor , count(value) as movies_count
 from Netflix
cross apply string_split(cast , ',')
where country = 'india' and type = 'movie'
group by value
order by movies_count desc
 

/*15:Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/

select category , count(category) as category_count
from (

select
	case 
		when description like '%kill%' or description like '%violence%' then 'Bad'
		else 'Good'
	end as category
from Netflix
where description is not null
) as t

group by category





