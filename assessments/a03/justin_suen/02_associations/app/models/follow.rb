# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  player_id  :integer          not null
#  fan_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Follow < ActiveRecord::Base
  belongs_to :player,
    primary_key: :id,
    foreign_key: :player_id,
    class_name: "Player"

  belongs_to :fan,
    primary_key: :id,
    foreign_key: :fan_id,
    class_name: "Fan"
end
