require_relative "piece"

class Pawn < Piece
  def initialize(color, rank)
  end

  def symbol
    if color == :black
      " #{"\u265F".encode('utf-8')} "
    else
      " #{"\u2659".encode('utf-8')} "
    end
  end
end
