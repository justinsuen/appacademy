# Represents a computer Crazy Eights player.
class AIPlayer
  attr_reader :cards

  # Creates a new player and deals them a hand of eight cards.
  def self.deal_player_in(deck)
    AIPlayer.new(deck.take(8))
  end

  def initialize(cards)
    @cards = cards
  end

  # Returns the suit the player has the most of; this is the suit to
  # switch to if player gains control via eight.
  def favorite_suit
    suit_count = Hash.new(0)
    @cards.each do |card|
      suit_count[card.suit] += 1
    end

    fave_suit = :clubs
    suit_count.each do |k, v|
      fave_suit = k if suit_count[fave_suit] < v
    end
    fave_suit
  end

  # Plays a card from hand to the pile, removing it from the hand. Use
  # the pile's `#play` and `#play_eight` methods.
  def play_card(pile, card)
    raise "cannot play card outside your hand" if !@cards.include?(card)

    if card.value == :eight
      pile.play_eight(card, favorite_suit)
    else
      pile.play(card)
    end
    @cards.delete(card)
  end

  # Draw a card from the deck into player's hand.
  def draw_from(deck)
    @cards += deck.take(1)
  end

  # Choose any valid card from the player's hand to play; prefer
  # non-eights to eights (save those!). Return nil if no possible
  # play. Use `Pile#valid_play?` here; do not repeat the Crazy Eight
  # rules written in the `Pile`.
  def choose_card(pile)
    return_card = nil
    @cards.each do |card|
      if pile.valid_play?(card) and card.value != :eight
        return_card = card
        break
      end
    end
    @cards.each do |card|
      return_card = card if card.value == :eight
    end if return_card == nil
    return_card
  end

  # Try to choose a card; if AI has a valid play, play the card. Else,
  # draw from the deck and try again until there is a valid play.
  # If deck is empty, pass.
  def play_turn(pile, deck)
    poss = choose_card(pile)
    until poss != nil
      draw_from(deck)
      poss = choose_card(pile)
      break if poss != nil
      return nil if deck.empty?
    end
    play_card(pile, poss)
  end
end
