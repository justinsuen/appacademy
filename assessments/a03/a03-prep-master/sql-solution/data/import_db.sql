CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  yr INTEGER NOT NULL,
  director INTEGER NOT NULL
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE castings (
  movie_id INTEGER NOT NULL,
  actor_id INTEGER NOT NULL,
  ord INTEGER NOT NULL,

  FOREIGN KEY(movie_id) REFERENCES movies(id),
  FOREIGN KEY(actor_id) REFERENCES actors(id)
);

.separator "\t"
.import "./data/tabmovie.txt" movies
.import "./data/tabactor.txt" actors
.import "./data/tabcasting.txt" castings
