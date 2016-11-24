require_relative "piece"
require_relative "./modules/sliding_piece"

class Rook < Piece
  include SlidingPiece

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    linear
  end

  def symbol
    if color == :black
      " #{"\u265C".encode('utf-8')} "
    else
      " #{"\u2656".encode('utf-8')} "
    end
  end
end
