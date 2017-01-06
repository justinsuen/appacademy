# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  pokemon_id :integer          not null
#  name       :string           not null
#  price      :integer          not null
#  happiness  :integer          not null
#  image_url  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
  belongs_to :pokemon

  validates :happiness, :image_url, :name, :pokemon, :price, presence: true
  validates :happiness, :price, numericality: true
end
