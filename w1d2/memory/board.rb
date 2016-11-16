require_relative 'card.rb'

class Board
  attr_reader :grid, :length

  def initialize(*cards)
    @grid = populate(cards)
    @length = grid.flatten.length
  end

  def populate(cards)
    res = cards + duplicate_cards(cards)
    res.shuffle!
  end

  def render
    p display_board
  end

  def duplicate_cards(cards)
    cards.map(&:dup)
  end

  def display_board
    @grid.map do |card|
      if card.face_up?
        card.face_value
      else
        " * "
      end
    end
  end

  def won?
    grid.all?(&:face_up?)
  end

  def reveal(guessed_pos)
    card = grid[guessed_pos]
    unless card.face_up?
      card.reveal
    end
    card.face_value
  end
end

# if $PROGRAM_NAME == __FILE__
#   card1 = Card.new(1)
#   card2 = Card.new(2)
#
#   board = Board.new(card1, card2)
#
#   board.render
# end
