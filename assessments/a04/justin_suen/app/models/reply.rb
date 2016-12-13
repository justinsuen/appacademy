# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  body       :string
#  tweet_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reply < ActiveRecord::Base
  validates :body, :tweet, presence: true

  belongs_to :tweet
end
