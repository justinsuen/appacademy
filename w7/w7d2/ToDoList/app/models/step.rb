class Step < ApplicationRecord
  validates :title, :todo_id, presence: true
  validates :done, inclusion: { in: [true, false] }
end
