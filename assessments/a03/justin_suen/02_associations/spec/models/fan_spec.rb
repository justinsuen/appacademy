# == Schema Information
#
# Table name: fans
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  favorite_team_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

RSpec.describe Fan, :type => :model do
  subject(:jack) { Fan.find(1) }
  let(:joe) { Fan.find_by(name: 'Joe') }
  let(:giant_george) { Player.find_by(name: 'Giant George') }
  let(:captain_carla) { Player.find_by(name: 'Captain Carla') }
  let(:jacks_first_follow) { Follow.find_by(
    fan_id: jack.id,
    player_id: giant_george.id
  )}
  let(:jacks_second_follow) { Follow.find_by(
    fan_id: jack.id,
    player_id: captain_carla.id
  )}

  it 'has a favorite team' do
    expect(jack.favorite_team.name).to eq('Giants')
  end

  describe 'Follows Players' do 
    it 'fan has associated follows' do 
      expect(jack.follows).to include(jacks_first_follow)
    end

    it 'fan has followed players' do 
      expect(jack.followed_players).to match_array([giant_george, captain_carla])
    end
  end

  describe 'Seats' do
    let(:seat1) { Seat.find(1) }
    let(:seat2) { Seat.find(2) }
    let(:flyers_sharks_game) { ScheduledGame.find_by(
      home_team_id: flyers.id,
      away_team_id: sharks.id
    )}
    let(:flyers_wizards_game) { ScheduledGame.find_by(
      home_team_id: flyers.id,
      away_team_id: wizards.id
    )}

    it 'fan can own many seats' do
      expect(joe.seats).to match_array([seat1, seat2])
    end
  end

end
