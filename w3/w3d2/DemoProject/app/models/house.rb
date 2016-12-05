class House < ActiveRecord::Base
  validates :address, :presence => true

  has_many :residents,
    primary_key: :id,
    foreign_key: :person_id,
    class_name: :Person
end
