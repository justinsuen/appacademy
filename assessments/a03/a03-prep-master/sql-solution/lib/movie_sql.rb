require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# List the films in which 'Chuck Norris' has appeared; order by movie
# title.
def bearded_films
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    actors.name = 'Chuck Norris'
  ORDER BY
    movies.title
SQL
end

# Obtain the cast list for the movie "Zombies of the Stratosphere";
# order by the actor's name.
def zombie_cast
  MovieDatabase.execute(<<-SQL)
  SELECT
    actors.name
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    movies.title = 'Zombies of the Stratosphere'
  ORDER BY
    actors.name
SQL
end

# Which were the busiest years for 'Danny DeVito'? Show the year and
# the number of movies he made each year for any year in which he made
# >2 movies. Order by year. Note the 'V' is capitalized.
def biggest_years_for_little_danny
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.yr, COUNT(*) AS count
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    actors.name = "Danny DeVito"
  GROUP BY
    movies.yr
  HAVING
    COUNT(*) > 2
SQL
end

# List the films where 'Nicolas Cage' has appeared, but not in the
# star role. Order by movie title.
def more_cage_please
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    (actors.name = 'Nicolas Cage' AND castings.ord != 1)
  ORDER BY
    movies.title
SQL
end

# List the films together with the leading star for all 1908
# films. Order by movie title.
def who_is_florence_lawrence
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, actors.name
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  JOIN
    movies ON castings.movie_id = movies.id
  WHERE
    (movies.yr = 1908 AND castings.ord = 1)
  ORDER BY
    movies.title
SQL
end

# Some actors listed in our database are not associated with any actual
# movie role(s). How many such actors are there? Alias this number as
# 'num_bad_actors'.
def count_bad_actors
  MovieDatabase.execute(<<-SQL)
  SELECT
    COUNT(*) AS 'num_bad_actors'
  FROM
    actors
  LEFT OUTER JOIN
    castings ON actors.id = castings.actor_id
  WHERE
    castings.actor_id IS NULL
SQL
end

# Obtain a list in alphabetical order of actors who've had exactly 20
# starring roles. Order by actor name.
def twenty_roles
  MovieDatabase.execute(<<-SQL)
  SELECT
    actors.name
  FROM
    actors
  JOIN
    castings ON actors.id = castings.actor_id
  WHERE
    castings.ord = 1
  GROUP BY
    actors.id
  HAVING
    COUNT(DISTINCT movie_id) = 20
  ORDER BY
    actors.name
SQL
end

# List the film title and the leading actor for all of the films
# 'Chris Farley' played in.
def chris_is_missed
  MovieDatabase.execute(<<-SQL)
  SELECT
    movies.title, lead_actor.name
  FROM
    actors AS chris_actor
  JOIN
    castings AS chris_casting ON chris_actor.id = chris_casting.actor_id
  JOIN
    movies ON chris_casting.movie_id = movies.id
  JOIN
    castings AS lead_casting ON movies.id = lead_casting.movie_id
  JOIN
    actors AS lead_actor ON lead_casting.actor_id = lead_actor.id
  WHERE
    (chris_actor.name = "Chris Farley" AND lead_casting.ord = 1)
  ORDER BY
    movies.title
SQL
end
