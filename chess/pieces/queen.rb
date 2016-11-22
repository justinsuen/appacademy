require_relative "piece"
require_relative "./modules/sliding_piece"

class Queen < Piece
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def symbol
    if color == :black
      " #{"\u265B".encode('utf-8')} "
    else
      " #{"\u2655".encode('utf-8')} "
    end
  end
end
