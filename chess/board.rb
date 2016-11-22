require_relative "pieces"

class Board
  attr_reader :rows

  def initialize
    @rows = rows
    populate_board
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def fill_pawn_row(color)
    row = (color == :white) ? 6 : 1
    8.times do |col|
      Pawn.new(self, color, [row, col])
    end
  end

  def fill_back_row(color)
    back_ranks = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    row = (color == :white) ? 7 : 0
    back_ranks.each_with_index do |rank, col|
      rank.new(self, color, [row, col])
    end
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, rows.length - 1) && col.between?(0, rows[1].length - 1)
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "There is no piece at starting position." if
      self[start_pos] == nil
    raise ArgumentError.new "You cannot move the piece there." if !valid_move?

    self[end_pos], self[start_pos] = self[start_pos], nil
  rescue ArgumentError => e
    puts "Try again! #{e.message}"
  end

  def populate_board
    null = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, null) }

    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end
  end

  def valid_move?
    true
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    rows[row][col] = piece
  end
end
