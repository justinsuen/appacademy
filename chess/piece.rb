class Piece
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    type
  end
end

class NullPiece < Piece
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
