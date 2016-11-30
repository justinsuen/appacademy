class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    new_url = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(short_url: new_url)
      new_url = SecureRandom::urlsafe_base64
    end
    new_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(user_id: user.id, short_url: ShortenedUrl.random_code,
                         long_url: long_url)
  end
end
