# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  moves      :string           default("{}"), not null, is an Array
#  image_url  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
