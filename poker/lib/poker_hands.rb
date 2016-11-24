module PokerHands

  def count(card)
    ranks = hand.map(&:rank)
    ranks.count(card.rank)
  end

  def high_card
    hand.last
  end

  def one_pair?
    hand.each do |card|
      return true if count(card) == 2
    end

    false
  end

  def three_of_kind?
    hand.each do |card|
      return true if count(card) == 3
    end

    false
  end

  def flush?
    suit = hand[0].suit
    hand.all? { |card| card.suit == suit }
  end

  def straight?
    hand[0..3].each_with_index do |_, i|
      return false unless hand[i + 1].rank - hand[i].rank == 1
    end

    true
  end

  def straight_flush?
    straight? && flush?
  end

end
