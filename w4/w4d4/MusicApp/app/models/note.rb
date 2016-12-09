# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  note       :string
#  track_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  belongs_to :track
end
