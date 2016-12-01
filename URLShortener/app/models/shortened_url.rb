class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :long_url, length: { maximum: 1024 }
  validate :less_than_five_posts_one_minute

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :clicks,
    primary_key: :short_url,
    foreign_key: :shortened_url,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :clicks,
    source: :users

  def less_than_five_posts_one_minute
    links = ShortenedUrl.all.where("created_at > ?", 1.minute.ago).group(:user_id).count
    if links.empty? || links[user_id].nil?
      return
    elsif links[user_id] > 5
      errors.add(:user_id, "can't shorten too quickly")
    end
  end

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
    visitors.count
  end

  def num_recent_uniques
    clicks.select(:user_id).distinct.where("created_at > ?", 10.minutes.ago).count
  end
end
