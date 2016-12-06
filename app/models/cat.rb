# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string
#  sex         :string(1)
#  description :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  COLORS = ["black", "white"].freeze
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, length: { is: 1 },
            inclusion: { in: %w(M F), message: "Your cat needs a sex!" }
  validates :color, inclusion: { in: COLORS }

  def age
    ((Date.today - birth_date).to_i / 365.0).round(1)
  end
end
