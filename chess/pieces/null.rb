require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  def initialize(rank = :null)
    super(rank)
  end

  def to_s
    "   "
  end
end
