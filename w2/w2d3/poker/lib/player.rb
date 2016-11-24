require_relative 'hand'

class Player
  attr_reader :hand, :pot

  def initialize(hand = nil, pot = 100)
    @hand = hand || Hand.new
    @pot = pot
  end

  def card_prompt
    puts "Which cards do you want to discard?"
    discard
  end

  def bet_prompt
    puts "Do you want to fold, see, or raise?"
    make_bet
  end

  def discard
    pos = gets.chomp.split(",").map(&:Integer)
    pos.each { |n| hand.trade_card(n) }
  end

  def take_cards(*cards)
    new_hand = hand.hand + cards
    @hand = Hand.new(new_hand)
  end

  def make_bet
  end
end
