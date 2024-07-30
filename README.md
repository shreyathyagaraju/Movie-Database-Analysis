# Movie Database Analysis

## Project Overview

This project involves creating a comprehensive movie database to analyze and gain insights into various aspects of movies and actors. The database includes data on movies, actors, and their relationships. Using SQL, we perform several analyses to extract meaningful information about movie genres, box office performance, average ratings by year, and actor participation.

## Table of Contents

- [Project Description](#project-description)
- [Setup Instructions](#setup-instructions)
- [Database Schema](#database-schema)
- [Sample Data](#sample-data)
- [Analysis Queries](#analysis-queries)
- [How to Use](#how-to-use)

## Project Description

The goal of this project is to build a movie database and perform various analyses. The database schema includes tables for movies, actors, and their relationships. The analyses cover genre popularity, top-grossing movies, average ratings by year, and actor participation.

## Setup Instructions

1. **Create the Database and Tables**

   - Download the `movie_database_analysis.sql` file from this repository.
   - Open your MySQL client and run the SQL script to create the database and tables, and insert sample data.

     ```bash
     mysql -u your_username -p < movie_database_analysis.sql
     ```

2. **Verify Database Creation**

   - Connect to your MySQL server and use the following command to check if the `movie_db` database and tables are created:

     ```sql
     USE movie_db;
     SHOW TABLES;
     ```

## Database Schema

The schema consists of the following tables:

### `movies`

- `movie_id` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for each movie.
- `title` (VARCHAR(255)): Title of the movie.
- `release_year` (YEAR): Year the movie was released.
- `genre` (VARCHAR(100)): Genre of the movie.
- `rating` (DECIMAL(3, 1)): IMDB rating of the movie.
- `box_office` (DECIMAL(15, 2)): Box office revenue of the movie.

### `actors`

- `actor_id` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for each actor.
- `name` (VARCHAR(255)): Name of the actor.

### `movie_actors`

- `movie_id` (INT): Foreign key referencing `movies(movie_id)`.
- `actor_id` (INT): Foreign key referencing `actors(actor_id)`.
- PRIMARY KEY (`movie_id`, `actor_id`): Composite primary key.

## Sample Data

The sample data includes a range of movies and actors, as well as their relationships. This data is used to demonstrate various queries and analyses.

## Analysis Queries

Here are some SQL queries used to analyze the movie database:

1. **Genre Popularity Analysis**

   ```sql
   SELECT
       genre,
       COUNT(movie_id) AS number_of_movies,
       AVG(rating) AS average_rating
   FROM movies
   GROUP BY genre
   ORDER BY number_of_movies DESC;
   
2. ** Top 10 Highest grossing movies** 
SELECT
    title,
    box_office
FROM movies
ORDER BY box_office DESC
LIMIT 10;

3. ** Average Rating by Year **
SELECT
    release_year,
    AVG(rating) AS average_rating
FROM movies
GROUP BY release_year
ORDER BY release_year;

4. ** Actor Participation Analysis **
SELECT
    a.name AS actor_name,
    COUNT(ma.movie_id) AS number_of_movies
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
GROUP BY a.actor_id
ORDER BY number_of_movies DESC;

How to Use
Run the SQL Script: Execute the movie_database_analysis.sql script to create the database and tables, and insert sample data.

Execute Queries: Use the provided analysis queries to explore the data and generate insights. Run these queries in your MySQL client to view the results.

Explore Further: Feel free to modify the schema, add more data, or create new queries to extend the analysis as needed.
