-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS movie_db;
USE movie_db;

-- Step 2: Create Tables
CREATE TABLE IF NOT EXISTS movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR,
    genre VARCHAR(100),
    rating DECIMAL(3, 1),
    box_office DECIMAL(15, 2)
);

CREATE TABLE IF NOT EXISTS actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE
);

-- Step 3: Insert Sample Data into Tables

-- Insert data into movies table
INSERT INTO movies (title, release_year, genre, rating, box_office)
VALUES
('Inception', 2010, 'Science Fiction', 8.8, 836836967),
('The Dark Knight', 2008, 'Action', 9.0, 1004558444),
('Interstellar', 2014, 'Science Fiction', 8.6, 677471339),
('The Matrix', 1999, 'Science Fiction', 8.7, 465343780),
('Forrest Gump', 1994, 'Drama', 8.8, 678226168),
('The Godfather', 1972, 'Crime', 9.2, 246120974),
('Pulp Fiction', 1994, 'Crime', 8.9, 213928762),
('Fight Club', 1999, 'Drama', 8.8, 101204835),
('The Shawshank Redemption', 1994, 'Drama', 9.3, 28341469),
('Gladiator', 2000, 'Action', 8.5, 187705427);

-- Insert data into actors table
INSERT INTO actors (name)
VALUES
('Leonardo DiCaprio'),
('Christian Bale'),
('Matthew McConaughey'),
('Keanu Reeves'),
('Tom Hanks'),
('Marlon Brando'),
('John Travolta'),
('Brad Pitt'),
('Tim Robbins'),
('Russell Crowe');

-- Insert data into movie_actors table
INSERT INTO movie_actors (movie_id, actor_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Step 4: Run Analysis Queries

-- 1. Genre Popularity Analysis
SELECT
    genre,
    COUNT(movie_id) AS number_of_movies,
    AVG(rating) AS average_rating
FROM movies
GROUP BY genre
ORDER BY number_of_movies DESC;

-- 2. Top 10 Highest-Grossing Movies
SELECT
    title,
    box_office
FROM movies
ORDER BY box_office DESC
LIMIT 10;

-- 3. Average Rating by Year
SELECT
    release_year,
    AVG(rating) AS average_rating
FROM movies
GROUP BY release_year
ORDER BY release_year;

-- 4. Actor Participation Analysis
SELECT
    a.name AS actor_name,
    COUNT(ma.movie_id) AS number_of_movies
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
GROUP BY a.actor_id
ORDER BY number_of_movies DESC;
