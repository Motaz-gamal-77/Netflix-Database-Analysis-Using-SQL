# Netflix-Database-Analysis-Using-SQL
# Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL.

# Objectives
- Analyze the distribution of content types (movies vs TV shows).
- Identify the most common ratings for movies and TV shows.
- List and analyze content based on release years, countries, and durations.
- Explore and categorize content based on specific criteria and keywords.

# Schema
```
CREATE TABLE netflix
(
    show_id      NVARCHAR(max),
    type         NVARCHAR(max),
    title        NVARCHAR(max),
    director     NVARCHAR(max),
    casts        NVARCHAR(max),
    country      NVARCHAR(max),
    date_added   NVARCHAR(max),
    release_year INT,
    rating       NVARCHAR(max),
    duration     NVARCHAR(max),
    listed_in    NVARCHAR(max),
    description  NVARCHAR(max)
);
```
