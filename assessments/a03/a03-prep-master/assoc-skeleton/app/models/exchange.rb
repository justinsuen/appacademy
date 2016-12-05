# == Schema Information
#
# Table name: exchanges
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Exchange < ActiveRecord::Base
  has_many :companies,
    primary_key: :id,
    foreign_key: :exchange_id,
    class_name: "Company"
end
