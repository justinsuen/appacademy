# == Schema Information
#
# Table name: steps
#
#  id         :integer          not null, primary key
#  title      :string
#  done       :boolean
#  todo_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Step < ApplicationRecord
  validates :title, :todo, presence: true
  validates :done, inclusion: { in: [true, false] }, default: false
  after_initialize { self.done = false if self.done.nil? }

  belongs_to :todo
end
