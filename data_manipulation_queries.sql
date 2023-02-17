-- Group 116: Brant Cass & Chase Smith


-- Variables denoted with curly braces, like this: {{variableName}}
-- Variables can come from textboxes input by user or from dropdowns
-- populated by the get queries

-- get all movies available                 
SELECT Movies.movie_title, Movies.movie_year FROM Movies;

-- get all actors currently in database     
SELECT Actors.first_name, Actors.last_name FROM Actors;

-- get all registered Users
SELECT Users.user_id, Users.user_email FROM Users;

-- get a user's movie history by User ID
SELECT Movies.movie_title FROM Movies
INNER JOIN UserMovies ON Movies.movie_id = UserMovies.user_movie_movie_id
INNER JOIN Users ON UserMovies.user_movie_user_id = Users.user_id
WHERE Users.user_id = {{userID}};

-- get a user's movie history by email
SELECT Movies.movie_title FROM Movies
INNER JOIN UserMovies ON Movies.movie_id = UserMovies.user_movie_movie_id
INNER JOIN Users ON UserMovies.user_movie_user_id = Users.user_id
WHERE Users.user_email = {{userEmail}};

-- get all movies featuring a particular actor
SELECT Movies.movie_title FROM Movies
INNER JOIN MovieActors ON Movies.movie_id = MovieActors.movie_actor_movie_id
INNER JOIN Actors ON MovieActors.movie_actor_actor_id = Actors.actor_id
WHERE Actors.first_name = {{actorFirstName}} AND Actors.last_name = {{actorLastName}};

-- get all movies of a particular genre
SELECT Movies.movie_title FROM Movies
INNER JOIN MovieGenres ON Movies.movie_id = MovieGenres.movie_genre_movie_id
INNER JOIN Genres ON MovieGenres.movie_genre_genre_id = Genres.genre_id
WHERE Genres.genre_name = {{genreName}};

-- get all movies of a particular mood
SELECT Movies.movie_title FROM Movies
INNER JOIN MovieMoods ON Movies.movie_id = MovieMoods.movie_mood_movie_id
INNER JOIN Moods ON MovieMoods.movie_mood_mood_id = Moods.mood_id
WHERE Moods.mood_name = {{moodName}};

-- get all movies of a particular age rating
SELECT Movies.movie_title FROM Movies
WHERE Movies.age_rating_id = {{ageRating}};

-- get all movies of a particular mood and genre
SELECT Movies.movie_title FROM Movies
INNER JOIN MovieGenres ON Movies.movie_id = MovieGenres.movie_genre_movie_id
INNER JOIN Genres ON MovieGenres.movie_genre_genre_id = Genres.genre_id
INNER JOIN MovieMoods ON Movies.movie_id = MovieMoods.movie_mood_movie_id
INNER JOIN Moods ON MovieMoods.movie_mood_mood_id = Moods.mood_id
WHERE Genres.genre_name = {{genreName}} AND Moods.mood_name = {{moodName}};

-- get all movies of a particular mood and genre and age rating
SELECT Movies.movie_title FROM Movies
INNER JOIN MovieGenres ON Movies.movie_id = MovieGenres.movie_genre_movie_id
INNER JOIN Genres ON MovieGenres.movie_genre_genre_id = Genres.genre_id
INNER JOIN MovieMoods ON Movies.movie_id = MovieMoods.movie_mood_movie_id
INNER JOIN Moods ON MovieMoods.movie_mood_mood_id = Moods.mood_id
INNER JOIN Age_Ratings ON Movies.age_rating_id = Age_Ratings.age_rating_id
WHERE Genres.genre_name = {{genreName}} AND Moods.mood_name = {{moodName}}
AND Age_Ratings.age_rating_description = {{ageRating}};

-- get all genres
SELECT Genres.genre_name FROM Genres;

-- get all moods
SELECT Moods.mood_name FROM Moods;

-- get all age ratings
SELECT Age_Ratings.age_rating_description FROM Age_Ratings;

-- Add a new actor
INSERT INTO Actors(first_name, last_name, actor_birth_date) VALUES
({{actorFirstName}}, {{actorLastName}}, {{actorBirthDate}});

-- Add new Movie
INSERT INTO Movies(movie_title, movie_year, age_rating_id) VALUES
({{movieTitle}}, {{movieYear}});

-- Add actor to movie / add movie to actor
INSERT INTO MovieActors (movie_actor_movie_id, movie_actor_actor_id) VALUES
((SELECT movie_id FROM Movies WHERE Movies.movie_title = {{movieTitle}}),
 (SELECT actor_id FROM Actors WHERE Actors.first_name = {{actorFirstName}} 
 AND Actors.last_name = {{actorLastName}}));

-- Add new User
INSERT INTO Users(user_email, user_phone) VALUES
({{userEmail}}, {{userPhoneNumber}});

-- Delete a User by ID
DELETE FROM Users WHERE user_id = {{userID}};

-- Delete an actor (removes them from all movies)
DELETE FROM Actors WHERE actor_id = {{actorID}};

-- Delete a movie (actors not deleted)
DELETE FROM Movies WHERE movie_id = {{movieID}};

-- Edit user email/phone
UPDATE Users SET user_email = {{userEmail}}, user_phone = {{userPhoneNumber}} 
WHERE user_id = {{userID}};

-- Edit actor name/birthdate
UPDATE Actors SET first_name = {{actorFirstName}}, 
last_name = {{actorLastName}}, actor_birth_date = {{actorBirthDate}} 
WHERE actor_id = {{actorID}};

-- Edit movie name/year
UPDATE Movies SET movie_title = {{movieTitle}}, movie_year = {{movieYear}}
WHERE movie_id = {{movieID}};

