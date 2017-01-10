class Review < ActiveRecord::Base
  validates :rating, inclusion: { in: (1..5) }
  validates :bench, presence: true
  belongs_to :bench
end
