require 'card'

describe Card do
  subject(:card) { Card.new(:spade, :a) }

  describe '#initialize' do
    it 'takes in suit' do
      expect(card.suit).to eq(:spade)
    end

    it 'takes in a rank' do
      expect(card.rank).to eq(:a)
    end
  end
end
