**Do not share this repo or post it publicly. We will take violations
very seriously.**

# Ultimate Frisbee League

We'll take **45min** for this part of the assessment.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

You have been appointed commissioner of the Bay Area Ultimate Frisbee
League. Your first order of business is to develop an application that
will keep track of all of your teams, stadiums, fans, players, jerseys,
and scheduled games, as well as which fans are following which players.

Your task today is to build the relationships between all of these
models. The database has already been setup and the models have been
annotated with their respective table schemas.

## Building Associations

The specs (`bundle exec rspec`) will guide you through building a
series of associations. Add `:line_number` at the end (`bundle exec rspec spec/models/seat_spec.rb:10`)
to run one specific spec. Refer to the `db/schema.rb` file to find the
format of the database; this will especially help you find the name of
foreign keys.

I would start by building `has_many`, `belongs_to` and `has_one`
associations. I would later build the various `:through` associations.

## Brief Description

Make sure to be looking at the specs and the `db/schema.rb`. Part of
your job is to be able to understand the structure and interrelations
of the data from these sources. However, here is a brief overview:

Teams have players, fans, and stadiums. Fans have a favorite team and
own seats in stadiums. Stadiums have seats and have a list of the games
played there.

Teams also have home games, away games, home opponents, and away opponents.
Each team has a captain, who is one of their players.

Players play for a team. Players have a captain, who is the captain of
their team. Players have many fans following them and fans can follow
many players. Finally, players each have a jersey.

**Copyright App Academy, please do not post online**
