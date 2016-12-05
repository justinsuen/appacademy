# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  player_id  :integer          not null
#  fan_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Follow, :type => :model do
  let(:captain_carla) { Player.find_by(name: 'Captain Carla') }
  let(:jill) { Fan.find_by(name: 'Jill') }

  subject(:jill_carla_follow) { Follow.find_by(
    player_id: captain_carla.id,
    fan_id: jill.id
  )}

  it 'is associated with a player' do 
    expect(jill_carla_follow.player).to eq(captain_carla)
  end

  it 'is associated with a fan' do
    expect(jill_carla_follow.fan).to eq(jill)
  end

end
