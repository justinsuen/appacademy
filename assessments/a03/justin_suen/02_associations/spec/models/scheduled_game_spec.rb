# == Schema Information
#
# Table name: scheduled_games
#
#  id             :integer          not null, primary key
#  home_team_id   :integer          not null
#  away_team_id   :integer          not null
#  scheduled_date :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

RSpec.describe ScheduledGame, :type => :model do
  let(:flyers) { Team.find_by(name: 'Flyers') }
  let(:sharks) { Team.find_by(name: 'Sharks') }

  let(:flyers_sharks_game) { ScheduledGame.find_by(
    home_team_id: flyers.id,
    away_team_id: sharks.id
  )}

  it 'is associated with a home team' do 
    expect(flyers_sharks_game.home_team).to eq(flyers)
  end

  it 'is associated with an away team' do
    expect(flyers_sharks_game.away_team).to eq(sharks)
  end

end
