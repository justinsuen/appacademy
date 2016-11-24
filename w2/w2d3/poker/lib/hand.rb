require_relative 'deck'
require_relative 'poker_hands'

class Hand
  include PokerHands

  attr_reader :hand

  def initialize(hand = [], deck = [])
    @hand = hand.sort_by(&:rank)
    @deck = deck
  end

  def trade_card(pos)
    delete_card = hand.delete_at(pos)
    deck.add_card(delete_card)
    hand << deck.remove_card #will split into discard, and take_card methods
  end

  def winning_hand?(other_hand)
    self.rank > other_hand.rank
  end
end
