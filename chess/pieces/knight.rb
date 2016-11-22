require_relative "piece"
require_relative "./modules/stepping_piece"

class Knight < Piece
  include SteppingPiece

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def symbol
    if color == :black
      " #{"\u2658".encode('utf-8')} "
    else
      " #{"\u265E".encode('utf-8')} "
    end
  end
end
