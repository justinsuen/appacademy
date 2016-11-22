require "colorize"

class Piece
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
