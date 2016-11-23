require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  let(:test_deck) { Deck.new([Card.new(:spade, :j), Card.new(:spade, :q),
                              Card.new(:spade, :k)]) }

  describe '#initialize' do
    it 'creates a deck with 52 cards' do
      expect(deck.cards.size).to eq(52)
    end

    it 'all cards in deck are unique' do
      expect(deck.cards).to eq(deck.cards.uniq)
    end
  end

  describe '#add_card' do
    it 'adds a card to the deck' do
      test_deck.add_card(Card.new(:spade, :a))
      expect(test_deck.cards.size).to eq(4)
    end

    it 'should not add a card already present in deck' do
      expect{ test_deck.add_card(Card.new(:spade, :k)) }.to raise_error("Card already in deck")
    end
  end

  describe '#remove_card' do
    it 'should remove a card' do
      test_deck.remove_card
      expect(test_deck.cards.size).to eq(2)
    end

    it 'removes top card' do
      expect(test_deck.remove_card).to eq(Card.new(:spade, :j))
    end

    it 'should raise an error if deck is empty' do
      empty_deck = Deck.new([])
      expect{ empty_deck.remove_card }.to raise_error("Deck is empty")
    end

  end

  describe '#shuffle_deck' do

  end
end
