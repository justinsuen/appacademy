# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  include BCrypt
  attr_reader :password

  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }

  after_initialize :ensure_session_token

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return user if user && user.is_password?(password)
    nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end

  def reset_session_token!
    self.session_token = generate_token
    self.save
    self.session_token
  end

  def generate_token
    SecureRandom.urlsafe_base64(128)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest) == password
  end

  private
  def ensure_session_token
    self.session_token ||= generate_token
    self.save
  end
end
