class Card

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ==(other_card)
    suit == other_card.suit && rank == other_card.rank
  end

end
