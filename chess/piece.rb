require "colorize"

class Piece
  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end

  def to_s
    rank.to_s + " "
  end
end

class NullPiece < Piece
  def initialize(rank)
    super(rank)
  end

  def to_s
    "  "
  end
end

class King < Piece
end

class Knight < Piece
end

class Pawn < Piece
end

class Bishop < Piece
end

class Rook < Piece
end

class Queen < Piece
end
