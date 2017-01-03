class Todo < ApplicationRecord
  validates :title, :body, presence: true, uniqueness: true
  validates :done, inclusion: { in: [true, false] }
end
