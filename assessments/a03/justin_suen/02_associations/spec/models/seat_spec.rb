# == Schema Information
#
# Table name: seats
#
#  id           :integer          not null, primary key
#  stadium_id   :integer          not null
#  row          :integer          not null
#  chair_number :integer          not null
#  owner_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

RSpec.describe Seat, :type => :model do
  subject(:seat) { Seat.find(1) }
  let(:joe) { Fan.find_by(name: 'Joe') }
  let(:flyers_stadium) { Stadium.find_by(name: 'Discus Dome') }

  it 'is owned by a fan' do 
    expect(seat.owner).to eq(joe)
  end

  it 'is associated with a stadium' do
    expect(seat.stadium).to eq(flyers_stadium)
  end
end
