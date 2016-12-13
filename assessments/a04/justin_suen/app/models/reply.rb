# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  body       :string
#  tweet_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Reply < ActiveRecord::Base
  validates :body, :tweet, :user_id, presence: true

  belongs_to :tweet
  belongs_to :user
end
