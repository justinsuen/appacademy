require 'card'

describe Card do
  subject(:card) { Card.new(:spade, 14) }

  describe '#initialize' do
    it 'takes in suit' do
      expect(card.suit).to eq(:spade)
    end

    it 'takes in a rank' do
      expect(card.rank).to eq(14)
    end
  end
end
