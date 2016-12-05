# == Schema Information
#
# Table name: jerseys
#
#  id         :integer          not null, primary key
#  color      :string
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Jersey < ActiveRecord::Base
  belongs_to :player,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: "Player"
end
