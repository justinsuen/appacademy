# == Schema Information
#
# Table name: fans
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  favorite_team_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Fan < ActiveRecord::Base
  belongs_to :favorite_team,
    primary_key: :id,
    foreign_key: :favorite_team_id,
    class_name: "Team"

  has_many :seats,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: "Seat"

  has_many :follows,
    primary_key: :id,
    foreign_key: :fan_id,
    class_name: "Follow"

  has_many :followed_players,
    through: :follows,
    source: :player
end
