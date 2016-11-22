require_relative "piece"
require_relative "./modules/stepping_piece"

class King < Piece
  def initialize(color, rank)
  end

  def symbol
    if color == :black
      " #{"\u265A".encode('utf-8')} "
    else
      " #{"\u2654".encode('utf-8')} "
    end
  end
end
