# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string           not null
#  album_type :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  validates :name, presence: true
end
