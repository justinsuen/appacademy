class User < ActiveRecord::Base
  include BCrypt

  after_initialize :ensure_session_token

  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password_digest, allow_nil: true

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user && user.is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(128)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password) == self.password_digest
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
