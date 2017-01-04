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
  validates :title, :todo_id, presence: true
  validates :done, inclusion: { in: [true, false] }, default: false

  belongs_to :todo
end
