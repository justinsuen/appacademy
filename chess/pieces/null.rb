require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  def initialize(board = nil, color = nil, pos = nil, rank = :null)
    super(board, color, pos, rank)
  end

  def symbol
    "   "
  end
end
