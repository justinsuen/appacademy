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
  validates :name, :email, :owner, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  def self.contacts_for_user_id(user_id)
    joins_cond = <<-SQL
      LEFT OUTER JOIN
        contact_shares ON contacts.id = contact_shares.contact_id
    SQL

    Contact
      .joins(joins_cond)
      .where("(contacts.user_id = :user_id) OR (contact_shares.user_id = :user_id)", user_id: user_id)
      .uniq
  end
end
