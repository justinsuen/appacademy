require_relative "piece"
require_relative "./modules/stepping_piece"

class Knight < Piece
  include SteppingPiece
  DELTA = [[2, 1], [1, 2], [-2, 1], [-1, 2],
           [-2, -1], [-1, -2], [2, -1], [1, -2]]

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_diff
    DELTA
  end

  def symbol
    if color == :black
      " #{"\u265E".encode('utf-8')} "
    else
      " #{"\u2658".encode('utf-8')} "
    end
  end
end
