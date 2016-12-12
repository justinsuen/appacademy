# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  details    :string
#  completed  :boolean          default("false")
#  privacy    :boolean          default("false")
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
end
