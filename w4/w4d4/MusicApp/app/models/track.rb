# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string           not null
#  track_type :string           not null
#  lyrics     :string
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  validates :name, presence: true
end
