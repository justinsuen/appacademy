require 'rspec'
require 'movie_sql'

describe "#zoolander_cast" do
  it "1. List Zoolander cast by name" do
    expect(zoolander_cast).to eq([
      {"name"=>"Alexander Skarsgård"},
      {"name"=>"Andy Dick"},
      {"name"=>"Anne Meara"},
      {"name"=>"Ben Stiller"},
      {"name"=>"Christine Taylor"},
      {"name"=>"David Duchovny"},
      {"name"=>"James Marsden"},
      {"name"=>"Jennifer Coolidge"},
      {"name"=>"Jerry Stiller"},
      {"name"=>"John Vargas"},
      {"name"=>"Jon Voight"},
      {"name"=>"Justin Theroux"},
      {"name"=>"Matt Levin"},
      {"name"=>"Milla Jovovich"},
      {"name"=>"Nora Dunn"},
      {"name"=>"Owen Wilson"},
      {"name"=>"Patton Oswalt"},
      {"name"=>"Tony Kanal"},
      {"name"=>"Will Ferrell"},
      {"name"=>"Woodrow Asai"}
    ])
  end
end

describe "#matt_damon_films" do
  it "2. List Matt Damon films by movie title" do
    expect(matt_damon_films).to eq([
      {"title"=>"All the Pretty Horses"},
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Good Will Hunting"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Rounders"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"Spirit: Stallion of the Cimarron"},
      {"title"=>"Stuck on You"},
      {"title"=>"The Adjustment Bureau"},
      {"title"=>"The Bourne Identity"},
      {"title"=>"The Bourne Ultimatum"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Good Shepherd"},
      {"title"=>"The Informant!"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"The Rainmaker"},
      {"title"=>"The Talented Mr. Ripley"},
      {"title"=>"True Grit"},
      {"title"=>"We Bought a Zoo"}
    ])
  end
end

describe "#christopher_walken_21st_century_films" do
  it "3. List Christopher Walken 21st century films by movie title" do
    expect(christopher_walken_21st_century_films).to eq([
      {"title"=>"Balls of Fury", "yr"=>2007},
      {"title"=>"Catch Me If You Can", "yr"=>2002},
      {"title"=>"Click", "yr"=>2006},
      {"title"=>"Envy", "yr"=>2004},
      {"title"=>"Gigli", "yr"=>2003},
      {"title"=>"Joe Dirt", "yr"=>2001},
      {"title"=>"Man On Fire", "yr"=>2004},
      {"title"=>"Man of the Year", "yr"=>2006},
      {"title"=>"The Country Bears", "yr"=>2002},
      {"title"=>"The Rundown", "yr"=>2003},
      {"title"=>"The Stepford Wives", "yr"=>2004},
      {"title"=>"Wedding Crashers", "yr"=>2005}
    ])
  end
end

describe "#old_films_and_their_star" do
  it "4. List 1906-1908 films and leading stars by movie title" do
    expect(old_films_and_their_star).to eq([
      {"title"=>"After Many Years", "star"=>"Florence Lawrence"},
      {"title"=>"His Wife's Child", "star"=>"Florence Lawrence"},
      {"title"=>"L'Assassinat du Duc de Guise", "star"=>"Henri III"},
      {"title"=>"L'Enfant prodigue", "star"=>"Georges Wague"},
      {"title"=>"Macbeth", "star"=>"William Ranous"},
      {"title"=>"Rescued from an Eagle's Nest", "star"=>"D. W. Griffith"},
      {"title"=>"The Adventures of Dollie", "star"=>"Arthur V. Johnson"},
      {"title"=>"The Fairylogue and Radio-Plays", "star"=>"L. Frank Baum"},
      {"title"=>"The Story of the Kelly Gang", "star"=>"Nicholas Brierley"},
      {"title"=>"The Taming of the Shrew", "star"=>"Florence Lawrence"}
    ])
  end
end

describe "#no_casting_info" do
  it "5. Give the movie from 1920 with no casting information" do
    expect(no_casting_info).to eq([
      {"title"=>"The Mark of Zorro"}
    ])
  end
end

describe "#biggest_stars" do
  it "6. List actors with >= 26 starring roles (by name)" do
    expect(biggest_stars).to eq([
      {"name"=>"Clint Eastwood", "count"=>26},
      {"name"=>"Robert De Niro", "count"=>26}
    ])
  end
end

describe "#julie_andrews_stars" do
  it "7. List the leading actor for all Julie Andrew films (by movie title)" do
    expect(julie_andrews_stars).to eq([
      { "title" => "10", "name" => "Dudley Moore" },
      { "title" => "Darling Lili", "name" => "Julie Andrews" },
      { "title" => "Despicable Me", "name" => "Steve Carell" },
      { "title" => "Relative Values", "name" => "Julie Andrews" },
      { "title" => "S.O.B.", "name" => "Julie Andrews" },
      { "title" => "Star!", "name" => "Julie Andrews" },
      { "title" => "The Americanization of Emily", "name" => "James Garner" },
      { "title" => "The Pink Panther Strikes Again", "name" => "Peter Sellers" },
      { "title" => "The Sound of Music", "name" => "Julie Andrews" },
      { "title" => "Thoroughly Modern Millie", "name" => "Julie Andrews" },
      { "title" => "Tooth Fairy", "name" => "Dwayne Johnson" },
      { "title" => "Torn Curtain", "name" => "Paul Newman" },
      { "title" => "Victor Victoria", "name" => "Julie Andrews" }
    ])
  end
end

describe "#busiest_john_travolta_years" do
  it "8. List years in which John Travolta made >2 films" do
    expect(busiest_john_travolta_years).to eq([
      { "yr" => 1998, "count" => 3 }
    ])
  end
end

