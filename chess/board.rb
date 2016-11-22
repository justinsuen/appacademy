require_relative "pieces/piece"

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
    Array.new(8) { Array.new(8, NullPiece.new(:null)) }
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
    # rook_pos = [[0, 0], [7, 0], [0, 7], [7, 7]]
    # rook_pos.each { |pos| self[pos] = Piece.new(:R) }
    #
    # king_pos = [[0, 3], [7, 3]]
    # king_pos.each { |pos| self[pos] = Piece.new(:K) }
    #
    # queen_pos = [[0, 4], [7, 4]]
    # queen_pos.each { |pos| self[pos] = Piece.new(:Q) }
    #
    # bishop_pos = [[0, 2], [7, 2], [0, 5], [7, 5]]
    # bishop_pos.each { |pos| self[pos] = Piece.new(:B) }
    #
    # knight_pos = [[0, 1], [7, 1], [0, 6], [7, 6]]
    # knight_pos.each { |pos| self[pos] = Piece.new(:N) }

    PIECE_POSITIONS.each do |piece, positions|
      positions.each { |pos| self[pos] = Piece.new(piece) }
    end

    #pawns
    8.times do |i|
      self[[1, i]] = Piece.new(:wP)
      self[[6, i]] = Piece.new(:bP)
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
