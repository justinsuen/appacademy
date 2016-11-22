require_relative "piece"
require_relative "./modules/sliding_piece"

class Bishop < Piece
  def initialize(color, rank)
  end

  def symbol
    if color == :black
      " #{"\u265D".encode('utf-8')} "
    else
      " #{"\u2657".encode('utf-8')} "
    end
  end
end
