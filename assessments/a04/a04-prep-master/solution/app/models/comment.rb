class Comment < ActiveRecord::Base
  validates :body, :link, :user, presence: true

  belongs_to :user
  belongs_to :link
end
