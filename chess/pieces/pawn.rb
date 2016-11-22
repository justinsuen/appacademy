require_relative "piece"

class Pawn < Piece
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def symbol
    if color == :black
      " #{"\u265F".encode('utf-8')} "
    else
      " #{"\u2659".encode('utf-8')} "
    end
  end
end
