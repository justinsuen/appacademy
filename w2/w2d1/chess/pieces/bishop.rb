require_relative "piece"
require_relative "./modules/sliding_piece"

class Bishop < Piece
  include SlidingPiece

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    diag
  end

  def symbol
    if color == :black
      " #{"\u265D".encode('utf-8')} "
    else
      " #{"\u2657".encode('utf-8')} "
    end
  end
end
