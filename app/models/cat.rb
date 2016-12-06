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
require 'action_view'
require 'action_view/helpers'

class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  COLORS = ["black", "white", "brown", "orange"].freeze
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, length: { is: 1 },
            inclusion: { in: %w(M F), message: "Your cat needs a sex!" }
  validates :color, inclusion: { in: COLORS }

  def age
    time_ago_in_words(birth_date)
    # ((Date.today - birth_date).to_i / 365.0).round(1)
  end
end
