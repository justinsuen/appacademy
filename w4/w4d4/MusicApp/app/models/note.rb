# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :string
#  track_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  validates :content, :track_id, :user_id, presence: true

  belongs_to :user
  belongs_to :track
end
