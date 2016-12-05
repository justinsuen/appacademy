# == Schema Information
#
# Table name: stadia
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  team_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Stadium, :type => :model do
  let(:discus_dome) { Stadium.find_by(name: 'Discus Dome') }
  let(:flyers) { Team.find_by(name: 'Flyers') }
  let(:sharks) { Team.find_by(name: 'Sharks') }
  let(:wizards) { Team.find_by(name: 'Wizards') }
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

  it 'belongs to a team' do 
    expect(discus_dome.team).to eq(flyers)
  end

  it 'has reserved seats' do 
    expect(discus_dome.seats).to match_array([seat1, seat2])
  end

  it 'has a list of games played there' do 
    expect(discus_dome.games).to match_array([flyers_sharks_game, flyers_wizards_game])
  end
end
