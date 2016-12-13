# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  validates :title, :body, :user_id, presence: true
  validates :body, length: { maximum: 140 }

  has_many :replies
  belongs_to :user
end
