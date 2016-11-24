require_relative "card"

class Deck
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  SUITS = [:diamond, :spade, :heart, :club]

  attr_reader :cards

  def initialize(cards = nil)
    @cards = cards || populate
  end

  def populate
    new_deck = []

    RANKS.each do |rank|
      SUITS.each do |suit|
        new_deck << Card.new(suit, rank)
      end
    end

    new_deck
  end

  def add_card(new_card)
    if cards.include?(new_card)
      raise "Card already in deck"
    else
      @cards << new_card
    end
  end

  def remove_card
    raise "Deck is empty" if cards.empty?
    cards.shift
  end

  def shuffle_deck
    cards.shuffle!
  end
end
