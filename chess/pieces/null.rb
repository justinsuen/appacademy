require_relative "piece"

class NullPiece < Piece
  def initialize(rank)
    super(rank)
  end

  def to_s
    "   "
  end
end
