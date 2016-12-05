# == Schema Information
#
# Table name: stadia
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  team_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stadium < ActiveRecord::Base
  belongs_to :team,
    primary_key: :id,
    foreign_key: :team_id,
    class_name: "Team"

  has_many :seats,
    primary_key: :id,
    foreign_key: :stadium_id,
    class_name: "Seat"

  has_many :games,
    through: :team,
    source: :home_games
end
