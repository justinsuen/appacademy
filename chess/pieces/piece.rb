require "colorize"

class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos

    board.add_piece(self, pos)
  end

  def to_s
    symbol
  end

  def valid_moves
    moves.reject { |position| moves_into_check?(position) }
  end

  def moves_into_check?(end_pos)
    dup_board = board.dup
    dup_board.move_piece!(color, pos, end_pos)
    dup_board.in_check?(color)
  end
end
