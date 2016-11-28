require 'rspec'
require 'deck'
require 'pile'

describe Pile do
  subject(:pile) { Pile.new(top_card) }
  let(:top_card) { Card.new(:clubs, :deuce) }

  describe '#initialize' do
    it 'correctly sets the top card' do
      expect(pile.top_card).to eq(top_card)
    end
  end

  describe '#current_value' do
    it 'returns the top card value' do
      expect(pile.current_value).to eq(top_card.value)
    end
  end

  describe '#current_suit' do
    it 'returns the top card suit (for non-eights)' do
      expect(pile.current_suit).to eq(top_card.suit)
    end
  end

  describe '#valid_play?' do
    it 'approves playing a card of the same suit' do
      expect(pile.valid_play?(Card.new(:clubs, :three))).to eq(true)
    end

    it 'aproves playing a card of the same rank' do
      expect(pile.valid_play?(Card.new(:diamonds, :deuce))).to eq(true)
    end

    it 'approves any eight' do
      expect(pile.valid_play?(Card.new(:diamonds, :eight))).to eq(true)
    end

    it 'rejects a non-matching, non-eight play' do
      expect(
        pile.valid_play?(Card.new(:diamonds, :seven))
      ).to eq(false)
    end
  end

  describe '#play' do
    it 'changes top card on valid play' do
      played_card = Card.new(:clubs, :seven)

      pile.play(played_card)
      expect(pile.top_card).to eq(played_card)
    end

    it 'changes current_suit on value play' do
      pile.play(Card.new(:diamonds, :deuce))

      expect(pile.current_value).to eq(:deuce)
      expect(pile.current_suit).to eq(:diamonds)
    end

    it 'changes current_value on suit play' do
      pile.play(Card.new(:clubs, :three))

      expect(pile.current_value).to eq(:three)
      expect(pile.current_suit).to eq(:clubs)
    end

    it 'rejects an invalid play' do
      expect do
        pile.play(Card.new(:diamonds, :seven))
      end.to raise_error('invalid play')
    end

    it 'rejects an eight played this way' do
      expect do
        pile.play(Card.new(:diamonds, :eight))
      end.to raise_error('must declare suit when playing eight')
    end
  end

  describe '#play_eight' do
    it 'rejects a non-eight card' do
      expect do
        pile.play_eight(Card.new(:clubs, :three), :hearts)
      end.to raise_error('must play eight')
    end

    it 'accepts a played eight' do
      played_card = Card.new(:diamonds, :eight)
      pile.play_eight(played_card, :hearts)

      expect(pile.top_card).to eq(played_card)
      expect(played_card.suit).to eq(:diamonds)
    end

    it 'changes suit when an eight is played' do
      played_card = Card.new(:diamonds, :eight)
      pile.play_eight(played_card, :hearts)

      expect(pile.current_suit).to eq(:hearts)
    end

    it 'affects what cards can be next played' do
      played_card = Card.new(:diamonds, :eight)
      pile.play_eight(played_card, :hearts)

      expect(pile.valid_play?(Card.new(:hearts, :four))).to eq(true)
    end

    it 'does not affect suits of subsequent plays' do
      pile.play_eight(Card.new(:diamonds, :eight), :hearts)

      # play a heart, then move to clubs
      pile.play(Card.new(:hearts, :four))
      pile.play(Card.new(:clubs, :four))

      # eight's choice of suit doesn't last forever
      expect(pile.current_suit).to eq(:clubs)
      expect(pile.valid_play?(Card.new(:clubs, :five))).to eq(true)
    end
  end
end
