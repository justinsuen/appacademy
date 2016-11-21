require_relative "piece"

class Board
  attr_reader :board

  def self.empty_board
    Array.new(8) { Array.new(8) }
  end

  def initialize(board = Board.empty_board)
    @board = board
    populate_board
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new "There is no piece at starting position." if
      self[start_pos] == nil
    raise ArgumentError.new "You cannot move the piece there." if !valid_move?

    self[end_pos], self[start_pos] = self[start_pos], nil
  rescue ArgumentError => e
    puts "Try again! #{e.message}"
  end

  def valid_move?
    true
  end

  def populate_board
    rook_pos = [[0, 0], [7, 0], [0, 7], [7, 7]]
    rook_pos.each { |pos| self[pos] = Piece.new(:R) }

    king_pos = [[0, 3], [7, 3]]
    king_pos.each { |pos| self[pos] = Piece.new(:K) }

    queen_pos = [[0, 4], [7, 4]]
    queen_pos.each { |pos| self[pos] = Piece.new(:Q) }

    bishop_pos = [[0, 2], [7, 2], [0, 5], [7, 5]]
    bishop_pos.each { |pos| self[pos] = Piece.new(:B) }

    knight_pos = [[0, 1], [7, 1], [0, 6], [7, 6]]
    knight_pos.each { |pos| self[pos] = Piece.new(:N) }

    #pawns
    8.times do |i|
      self[[1, i]] = Piece.new(:p)
      self[[6, i]] = Piece.new(:p)
    end
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    board[row][col] = piece
  end
end
