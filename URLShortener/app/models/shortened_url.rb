class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :clicks,
    primary_key: :short_url,
    foreign_key: :shortened_url,
    class_name: :Visit

  has_many :visitors,
    through: :clicks,
    source: :users

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

  def num_clicks
    clicks.count
  end

  def num_uniques
    clicks.select(:user_id).distinct.count
  end

  def num_recent_uniques
    clicks.select(:user_id).distinct.where("created_at > ?", 10.minutes.ago).count
  end
end
