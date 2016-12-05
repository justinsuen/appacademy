# == Schema Information
#
# Table name: jerseys
#
#  id         :integer          not null, primary key
#  color      :string
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Jersey, :type => :model do
  subject(:jersey) { Jersey.find(1) }
  let(:giant_george) { Player.find(1) }

  it 'belongs to a player' do 
    expect(jersey.player).to eq(giant_george)
  end
end
