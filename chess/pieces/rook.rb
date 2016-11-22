require_relative "piece"
require_relative "./modules/sliding_piece"

class Rook < Piece
  def initialize(color, rank)
  end

  def symbol
    if color == :black
      " #{"\u265C".encode('utf-8')} "
    else
      " #{"\u2656".encode('utf-8')} "
    end
  end
end
