class User < ActiveRecord::Base
  validates :name, :email, presence: true, uniqueness: true
end
