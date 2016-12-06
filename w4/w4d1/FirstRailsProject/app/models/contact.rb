# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
