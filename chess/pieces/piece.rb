require "colorize"

class Piece
  RANK_CODES = ["\u2654", "\u2655", "\u2656", "\u2657", "\u2658", "\u2659",
               "\u265A", "\u265B", "\u265C", "\u265D", "\u265E", "\u265F"].freeze

  attr_reader :board, :color
  attr_accessor :pos

  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos

    board.add_piece(self, pos)
  end

  def to_s
    symbol
  end

  def valid_moves
    moves
  end
end
