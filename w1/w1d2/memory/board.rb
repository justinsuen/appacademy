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
    if card.face_up?
      puts "You can't flip a card that has already been flipped."
    else
      card.reveal
    end
    card.face_value
  end
end
