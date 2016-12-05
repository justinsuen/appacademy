# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  team_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ActiveRecord::Base
  belongs_to :team,
    primary_key: :id,
    foreign_key: :team_id,
    class_name: "Team"

  has_many :follows,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: "Follow"

  has_many :followers,
    through: :follows,
    source: :fan

  has_many :jerseys,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: "Jersey"

  has_one :captain,
    through: :team,
    source: :captain
end
