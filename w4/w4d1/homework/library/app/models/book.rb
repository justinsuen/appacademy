class Book < ActiveRecord::Base
  validates :title, :author, presence: true
end
