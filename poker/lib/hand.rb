require_relative 'deck'
require_relative 'poker_hands'

class Hand
  include PokerHands

  attr_reader :hand

  def initialize(hand = [])
    @hand = hand.sort_by(&:rank)
  end

  def add_cards(num_cards)
    num_cards.times do
      deck.add_card(hand.shift)
      hand << deck.remove_card
    end
  end

  def winning_hand?(other_hand)
    self.rank > other_hand.rank
  end
end
