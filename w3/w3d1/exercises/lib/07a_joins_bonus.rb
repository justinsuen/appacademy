# == Schema Information
#
# Table name: albums
#
#  asin        :string       not null, primary key
#  title       :string
#  artist      :string
#  price       :float
#  rdate       :date
#  label       :string
#  rank        :integer
#
# Table name: styles
#
# album        :string       not null
# style        :string       not null
#
# Table name: tracks
# album        :string       not null
# disk         :integer      not null
# posn         :integer      not null
# song         :string

require_relative './sqlzoo.rb'

def alison_artist
  # Select the name of the artist who recorded the song 'Alison'.
  execute(<<-SQL)
  SELECT
    artist
  FROM
    albums al
    JOIN
      tracks t ON al.asin = t.album
  WHERE
    t.song = 'Alison'
  SQL
end

def exodus_artist
  # Select the name of the artist who recorded the song 'Exodus'.
  execute(<<-SQL)
  SELECT
    artist
  FROM
    albums al
    JOIN
      tracks t ON al.asin = t.album
  WHERE
    t.song = 'Exodus'
  SQL
end

def blur_songs
  # Select the `song` for each `track` on the album `Blur`.
  execute(<<-SQL)
  SELECT
    song
  FROM
    tracks t
    JOIN
      albums al ON al.asin = t.album
  WHERE
    al.title = 'Blur'
  SQL
end

def heart_tracks
  # For each album show the title and the total number of tracks containing
  # the word 'Heart' (albums with no such tracks need not be shown). Order first by
  # the number of such tracks, then by album title.
  execute(<<-SQL)
  SELECT
    al.title,
    COUNT(song)
  FROM
    tracks t
    JOIN
      albums al ON al.asin = t.album
  WHERE
    t.song LIKE '%Heart%'
  GROUP BY
    al.title
  ORDER BY
    COUNT(song) DESC, al.title ASC
  SQL
end

def title_tracks
  # A 'title track' has a `song` that is the same as its album's `title`. Select
  # the names of all the title tracks.
  execute(<<-SQL)
  SELECT
    song
  FROM
    tracks t
    JOIN
      albums al ON al.asin = t.album
  WHERE
    t.song = al.title
  SQL
end

def eponymous_albums
  # An 'eponymous album' has a `title` that is the same as its recording
  # artist's name. Select the titles of all the eponymous albums.
  execute(<<-SQL)
  SELECT
    al.title
  FROM
    albums al
  WHERE
    al.title = al.artist
  SQL
end

def song_title_counts
  # Select the song names that appear on more than two albums. Also select the
  # COUNT of times they show up.
  execute(<<-SQL)
  SELECT
    t.song, COUNT(DISTINCT al.asin)
  FROM
    tracks t
    JOIN
      albums al ON t.album = al.asin
  GROUP BY
    t.song
  HAVING
    COUNT(DISTINCT al.asin) > 2
  SQL
end

def best_value
  # A "good value" album is one where the price per track is less than 50
  # pence. Find the good value albums - show the title, the price and the number
  # of tracks.
  execute(<<-SQL)
  SELECT
    al.title, al.price, COUNT(t.song)
  FROM
    tracks t
    JOIN
      albums al ON t.album = al.asin
  GROUP BY
    al.asin
  HAVING
    al.price / COUNT(t.song) < 0.5
  SQL
end

def top_track_counts
  # Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101
  # tracks. List the top 10 albums. Select both the album title and the track
  # count, and order by both track count and title (descending).
  execute(<<-SQL)
  SELECT
    al.title, COUNT(t.song)
  FROM
    tracks t
    JOIN
      albums al ON t.album = al.asin
  GROUP BY
    al.asin
  ORDER BY
    COUNT(t.song) DESC, al.title DESC
  LIMIT 10
  SQL
end

def rock_superstars
  # Select the artist who has recorded the most rock albums, as well as the
  # number of albums. HINT: use LIKE '%Rock%' in your query.
  execute(<<-SQL)
  SELECT
    al.artist, COUNT(DISTINCT al.title)
  FROM
    albums al
    JOIN
      styles st ON st.album = al.asin
  WHERE
    st.style LIKE '%Rock%'
  GROUP BY
    al.artist
  ORDER BY
    COUNT(DISTINCT al.title) DESC
  LIMIT 1
  SQL
end

def expensive_tastes
  # Select the five styles of music with the highest average price per track,
  # along with the price per track. One or more of each aggregate functions,
  # subqueries, and joins will be required.
  #
  # HINT: Start by getting the number of tracks per album. You can do this in a
  # subquery. Next, JOIN the styles table to this result and use aggregates to
  # determine the average price per track.
  execute(<<-SQL)
  SELECT
    style,
    SUM(albums_with_count.price) / SUM(albums_with_count.count)
  FROM
    styles
    JOIN (
      SELECT
        albums.*,
        COUNT(t.song)
      FROM
        tracks t
        JOIN albums ON t.album = albums.asin
      WHERE
        price IS NOT NULL
      GROUP BY
        albums.asin
    ) AS albums_with_count ON styles.album = albums_with_count.asin
  GROUP BY
    styles.style
  ORDER BY
    SUM(albums_with_count.price) / SUM(albums_with_count.count) DESC
  LIMIT 5
  SQL
end
