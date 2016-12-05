# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  city       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  captain_id :integer
#

RSpec.describe Team, :type => :model do
  subject(:giants) { Team.find_by(name: 'Giants') }
  let(:frisbee_field) { Stadium.find_by(team_id: giants.id) }
  let (:giant_george) { Player.find_by(name: 'Giant George') }
  let (:big_bill) { Player.find_by(name: 'Big Bill') }
  let (:captain_carla) { Player.find_by(name: 'Captain Carla') }
  let (:jack) { Fan.find_by(name: 'Jack') } 
  let (:jill) { Fan.find_by(name: 'Jill') }

  it 'has players' do
    expect(giants.players).to match_array([giant_george, big_bill, captain_carla])
  end

  it 'has fans' do 
    expect(giants.fans).to match_array([jack, jill])
  end

  it 'has one stadium' do 
    expect(giants.stadium).to eq(frisbee_field)
  end

  it 'has a captain' do 
    expect(giants.captain).to eq(captain_carla)
  end

  describe 'Schedule' do 
    let(:sharks) { Team.find_by(name: 'Sharks') }
    let(:wizards) { Team.find_by(name: 'Wizards') }
    let(:giants_flyers_game) { ScheduledGame.find_by(
      home_team_id: giants.id,
      away_team_id: sharks.id
    )}
    let(:wizards_giants_game) { ScheduledGame.find_by(
      home_team_id: wizards.id,
      away_team_id: giants.id
    )}

    it 'teams have home games' do 
      expect(giants.home_games).to include(giants_flyers_game)
    end

    it 'teams have away games' do 
      expect(giants.away_games).to include(wizards_giants_game)
    end

    it 'teams have home opponents' do
      expect(giants.home_opponents).to include(sharks)
    end

    it 'teams have away opponents' do 
      expect(giants.away_opponents).to include(wizards)
    end
  end
end
