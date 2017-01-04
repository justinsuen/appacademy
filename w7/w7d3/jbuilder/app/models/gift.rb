class Gift < ActiveRecord::Base
  validates :description, :title, :guest, presence: true

  belongs_to :guest
end
