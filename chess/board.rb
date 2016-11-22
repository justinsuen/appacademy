require_relative "pieces"

class Board
  PIECE_POSITIONS = {
    wR: [[0, 0], [0, 7]],
    bR: [[7, 0], [7, 7]],
    wK: [[0, 3]],
    bK: [[7, 3]],
    wQ: [[0, 4]],
    bQ: [[7, 4]],
    wB: [[0, 2], [0, 5]],
    bB: [[7, 2], [7, 5]],
    wN: [[0, 1], [0, 6]],
    bN: [[7, 1], [7, 6]]
  }.freeze

  attr_reader :rows

  def self.empty_board
    null = NullPiece.instance
    Array.new(8) { Array.new(8, null) }
  end

  def initialize(rows = Board.empty_board)
    @rows = rows
    populate_board
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
    color = :black

    PIECE_POSITIONS.each do |piece, positions|
      color == :white ? :black : :white
      positions.each { |pos| self[pos] = Piece.new(rows, color, pos, piece) }
    end

    #pawns
    8.times do |i|
      self[[1, i]] = Piece.new(rows, :white, [1, i], :wP)
      self[[6, i]] = Piece.new(rows, :black, [6, i], :bP)
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
