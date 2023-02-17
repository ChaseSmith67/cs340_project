
-- Add users to Users table
INSERT INTO Users(user_email, user_phone) VALUES
("abc@hi.com", "555-123-4567"),
("def@hi.com", "555-123-1234"),
("lmn@hi.com", "555-123-5678"),
("xyz@hi.com", "555-123-9876");

-- Add age ratinge to Age_Ratings table
INSERT INTO Age_Ratings(age_rating_id, age_rating_description) VALUES 
(1, "All Ages"), 
(2, "Older Children"), 
(3, "Teens"), 
(4, "Adults");

-- Add genres to Genres table
INSERT INTO Genres(genre_name) VALUES
("Comedy"),
("Science Fiction"),
("Thriller"),
("Romance"),
("Horror");

-- Add moods to Moods table
INSERT INTO Moods(mood_name) VALUES
("Funny"),
("Dark"),
("Intense"),
("Chill"),
("Sad");

-- Add actors to Actors table
INSERT INTO Actors(first_name, last_name, actor_birth_date) VALUES
("Keanu", "Reeves", "1964-09-02"),
("Woody", "Harrelson", "1961-07-23"),
("Mike", "Myers", "1963-05-23");

-- Add movies to Movies table
INSERT INTO Movies(movie_title, movie_year, age_rating_id) VALUES
("John Wick", "2014", 4),
("A Scanner Darkly", "2006", 4),
("Zombieland", "2009", 4),
("Shrek", "2001", 1);

-- Add movies and actors to MoviesActors - this builds the M:N relationships
-- Add Keanu Reeves:John Wick
INSERT INTO MovieActors (movie_actor_movie_id, movie_actor_actor_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "John Wick"),
 (SELECT actor_id FROM Actors WHERE Actors.first_name = "Keanu" AND Actors.last_name = "Reeves"));
-- Add Keanu Reeves:A Scanner Darkly
INSERT INTO MovieActors (movie_actor_movie_id, movie_actor_actor_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"),
 (SELECT actor_id FROM Actors WHERE Actors.first_name = "Keanu" AND Actors.last_name = "Reeves"));
-- Add Woody Harrelson:A Scanner Darkly
INSERT INTO MovieActors (movie_actor_movie_id, movie_actor_actor_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"),
 (SELECT actor_id FROM Actors WHERE Actors.first_name = "Woody" AND Actors.last_name = "Harrelson"));
-- Add Woody Harrelson:Zombieland
INSERT INTO MovieActors (movie_actor_movie_id, movie_actor_actor_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"),
 (SELECT actor_id FROM Actors WHERE Actors.first_name = "Woody" AND Actors.last_name = "Harrelson"));
-- Add Mike Myers: Shrek
INSERT INTO MovieActors (movie_actor_movie_id, movie_actor_actor_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"),
 (SELECT actor_id FROM Actors WHERE Actors.first_name = "Mike" AND Actors.last_name = "Myers"));

-- Add movies and genres to MoviesGenres - this builds the M:N relationships
-- Add John Wick:Thriller
INSERT INTO MovieGenres (movie_genre_movie_id, movie_genre_genre_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "John Wick"),
 (SELECT genre_id FROM Genres WHERE Genres.genre_name = "Thriller"));
-- Add A Scanner Darkly:Science Fiction
INSERT INTO MovieGenres (movie_genre_movie_id, movie_genre_genre_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"),
 (SELECT genre_id FROM Genres WHERE Genres.genre_name = "Science Fiction"));
-- Add A Scanner Darkly:Thriller
INSERT INTO MovieGenres (movie_genre_movie_id, movie_genre_genre_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"),
 (SELECT genre_id FROM Genres WHERE Genres.genre_name = "Thriller"));
-- Add Zombieland:Comedy
INSERT INTO MovieGenres (movie_genre_movie_id, movie_genre_genre_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"),
 (SELECT genre_id FROM Genres WHERE Genres.genre_name = "Comedy"));
-- Add Zombieland:Horror
INSERT INTO MovieGenres (movie_genre_movie_id, movie_genre_genre_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"),
 (SELECT genre_id FROM Genres WHERE Genres.genre_name = "Horror"));
-- Add Shrek:Comedy
INSERT INTO MovieGenres (movie_genre_movie_id, movie_genre_genre_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"),
 (SELECT genre_id FROM Genres WHERE Genres.genre_name = "Comedy"));

-- Add movies and moods to MoviesMoods - this builds the M:N relationships
-- Add John Wick:Dark
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "John Wick"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Dark"));
-- Add John Wick:Intense
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "John Wick"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Intense"));
-- Add A Scanner Darkly:Dark
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Dark"));
-- Add A Scanner Darkly:Intense
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Intense"));
-- Add Shrek:Funny
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Funny"));
-- Add Shrek:Chill
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Chill"));
-- Zombieland:Funny
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Funny"));
-- Zombieland:Dark
INSERT INTO MovieMoods (movie_mood_movie_id, movie_mood_mood_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"),
 (SELECT mood_id FROM Moods WHERE Moods.mood_name = "Dark"));

 -- Add users and movies into UsersMovies - this builds M:N relationships
 INSERT INTO UserMovies (user_movie_movie_id, user_movie_user_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"), 1),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Zombieland"), 3),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"), 1),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"), 1),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "A Scanner Darkly"), 4),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "John Wick"), 4),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"), 2),
((SELECT movie_id FROM Movies WHERE Movies.movie_title = "Shrek"), 3);