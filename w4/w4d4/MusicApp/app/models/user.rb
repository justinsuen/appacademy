# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  password_digest  :string           not null
#  session_token    :string
#  created_at       :datetime
#  updated_at       :datetime
#  note_id          :integer
#  activation       :boolean          default("false")
#  activation_token :string
#  admin            :boolean          default("false")
#

class User < ActiveRecord::Base
  include BCrypt
  attr_reader :password

  validates :activation_token, :email, :password_digest, :session_token, presence: true
  validates :activation_token, :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  validates :admin, default: false

  has_many :notes

  after_initialize :ensure_session_token
  after_initialize :set_activation_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user && user.is_password?(password)
    nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64(128)
  end

  def activate!
    self.update_attributes(activation: true)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest) == password
  end

  def make_admin!
    self.update_attributes(admin: true)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= User.generate_token
  end

  def set_activation_token
    self.activation_token = User.generate_token
  end

end
