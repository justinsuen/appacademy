# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  team_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Player, :type => :model do
  subject(:big_bill) { Player.find_by(name: 'Big Bill') }
  let(:captain_carla) { Player.find_by(name: 'Captain Carla') }
  let(:giants) { Team.find_by(name: 'Giants') }
  let(:jersey) { Jersey.find_by(player_id: big_bill.id ) }

  it 'plays for a team' do 
    expect(big_bill.team).to eq(giants)
  end

  it 'has one captain' do 
    expect(big_bill.captain).to eq(captain_carla)
  end

  it 'has one or more jerseys' do 
    expect(big_bill.jerseys).to include(jersey)
  end

  describe 'Fan Followers' do 
    let(:joe) { Fan.find_by(name: 'Joe') }
    let(:jane) { Fan.find_by(name: 'Jane') }
    let(:joe_bill_follow) { Follow.find_by(
      fan_id: joe.id,
      player_id: big_bill.id
    )}
    let(:jane_bill_follow) { Follow.find_by(
      fan_id: jane.id,
      player_id: big_bill.id
    )}

    it 'player has associated follows' do
      expect(big_bill.follows).to include(joe_bill_follow)
    end

    it 'player has many followers' do 
      expect(big_bill.followers).to match_array([joe, jane])
    end

  end

end
