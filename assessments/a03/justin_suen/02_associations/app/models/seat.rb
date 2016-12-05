# == Schema Information
#
# Table name: seats
#
#  id           :integer          not null, primary key
#  stadium_id   :integer          not null
#  row          :integer          not null
#  chair_number :integer          not null
#  owner_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Seat < ActiveRecord::Base
  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: "Fan"

  belongs_to :stadium,
    primary_key: :id,
    foreign_key: :stadium_id,
    class_name: "Stadium"
end
