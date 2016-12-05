ActiveRecord::Base.transaction do 
  #teams
  giants = Team.create!(name: "Giants", city: "San Jose", captain_id: 3)
  flyers = Team.create!(name: "Flyers", city: "San Francisco", captain_id: 4)
  sharks = Team.create!(name: "Sharks", city: "Palo Alto", captain_id: 5)
  wizards = Team.create!(name: "Wizards", city: "Mountain View", captain_id: 6)

  #fans
  jack = Fan.create!(name: "Jack", favorite_team_id: giants.id)
  jill = Fan.create!(name: "Jill", favorite_team_id: giants.id)
  joe = Fan.create!(name: "Joe", favorite_team_id: flyers.id)
  jane = Fan.create!(name: "Jane", favorite_team_id: sharks.id)

  #stadiums
  giants_stadium = Stadium.create!(name: "Frisbee Field", team_id: giants.id)
  flyers_stadium = Stadium.create!(name: "Discus Dome", team_id: flyers.id)
  sharks_stadium = Stadium.create!(name: "Shark Tank", team_id: sharks.id)
  wizards_stadium = Stadium.create!(name: "Magic Park", team_id: wizards.id)

  #players
  giant_george = Player.create!(name: "Giant George", team_id: giants.id)
  big_bill = Player.create!(name: "Big Bill", team_id: giants.id)
  captain_carla = Player.create!(name: "Captain Carla", team_id: giants.id)
  flying_felicia = Player.create!(name: "Flying Felicia", team_id: flyers.id)
  shane_sharker = Player.create!(name: "Shane Sharker", team_id: sharks.id)
  magic_mindy = Player.create!(name: "Magic Mindy", team_id: wizards.id)

  #jerseys
  Jersey.create!(color: "Green", player_id: giant_george.id)
  Jersey.create!(color: "Brown", player_id: giant_george.id)
  Jersey.create!(color: "Green", player_id: big_bill.id)
  Jersey.create!(color: "Green", player_id: captain_carla.id)
  Jersey.create!(color: "Yellow", player_id: flying_felicia.id)
  Jersey.create!(color: "Blue", player_id: shane_sharker.id)
  Jersey.create!(color: "Gold", player_id: magic_mindy.id)

  #rivalries
  ScheduledGame.create!(home_team_id: giants.id, away_team_id: sharks.id)
  ScheduledGame.create!(home_team_id: flyers.id, away_team_id: sharks.id)
  ScheduledGame.create!(home_team_id: flyers.id, away_team_id: wizards.id)
  ScheduledGame.create!(home_team_id: wizards.id, away_team_id: giants.id)
  ScheduledGame.create!(home_team_id: wizards.id, away_team_id: flyers.id)

  #follows
  Follow.create!(fan_id: jack.id, player_id: giant_george.id)
  Follow.create!(fan_id: joe.id, player_id: big_bill.id)
  Follow.create!(fan_id: jane.id, player_id: big_bill.id)
  Follow.create!(fan_id: jack.id, player_id: captain_carla.id)
  Follow.create!(fan_id: jill.id, player_id: captain_carla.id)

  Seat.create!(stadium_id: flyers_stadium.id, row: 1, chair_number: 1, owner_id: joe.id)
  Seat.create!(stadium_id: flyers_stadium.id, row: 1, chair_number: 1, owner_id: joe.id)

end