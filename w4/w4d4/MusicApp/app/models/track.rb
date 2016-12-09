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
#  note_id    :integer
#

class Track < ActiveRecord::Base
  validates :name, presence: true

  has_one :band
  belongs_to :album
  has_many :notes
end
