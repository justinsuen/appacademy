class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    cards = deck.take(2)
    Hand.new(cards)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    my_pts = 0
    not_aces = cards.reject { |el| el.value == :ace }
    not_aces.each { |el| my_pts += el.blackjack_value }

    my_aces = cards.select { |el| el.value == :ace }
    case my_aces.length
    when 0
      possible_ace_pts = [0]
    when 1
      possible_ace_pts = [11, 1]
    when 2
      possible_ace_pts = [12, 2]
    when 3
      possible_ace_pts = [13, 3]
    when 4
      possible_ace_pts = [14, 4]
    end

    possible_pts = []
    possible_ace_pts.each { |pts| possible_pts << my_pts + pts }
    return possible_pts.first if possible_pts.all? { |el| el > 21 }
    possible_pts.select { |el| el <= 21}.sort.last
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    points > other_hand.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
