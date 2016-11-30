class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
end
