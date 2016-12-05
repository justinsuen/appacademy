# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  city       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  captain_id :integer
#

class Team < ActiveRecord::Base
  has_many :fans,
    primary_key: :id,
    foreign_key: :favorite_team_id,
    class_name: "Fan"

  has_many :players,
    primary_key: :id,
    foreign_key: :team_id,
    class_name: "Player"

  has_one :stadium,
    primary_key: :id,
    foreign_key: :team_id,
    class_name: "Stadium"

  belongs_to :captain,
    primary_key: :id,
    foreign_key: :captain_id,
    class_name: "Player"

  has_many :home_games,
    primary_key: :id,
    foreign_key: :home_team_id,
    class_name: "ScheduledGame"

  has_many :away_games,
    primary_key: :id,
    foreign_key: :away_team_id,
    class_name: "ScheduledGame"

  has_many :home_opponents,
    through: :home_games,
    source: :away_team

  has_many :away_opponents,
    through: :away_games,
    source: :home_team
end
