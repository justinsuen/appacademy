require_relative "pieces"
require "byebug"

class Board
  attr_reader :rows, :null

  def initialize(fill = true)
    @rows = rows
    populate_board(fill)
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def check_mate?(color)
    in_check?(color) &&
      rows.flatten.none? { |pc| pc.color == color && !pc.valid_moves.nil? }
  end

  def dup
    dup_board = Board.new(fill = false)
    get_pieces.each { |pc| pc.class.new(dup_board, pc.color, pc.pos) }
    dup_board
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

  def find_king_pos(color)
    rows.each_with_index do |row, i|
      row.each_with_index do |_, j|
        pc = self[[i, j]]
        return pc if pc.class == King && pc.color == color
      end
    end
  end

  def get_pieces
    @rows.flatten.reject { |piece| piece == null }
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0, rows.length - 1) && col.between?(0, rows[1].length - 1)
  end

  def in_check?(color)
    king_pos = find_king_pos(color).pos

    get_pieces.any? do |pc|
      pc.color != color && pc.moves.include?(king_pos)
    end
  end

  def is_null?(pos)
    self[pos] == null
  end

  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos]

    # possible errors while moving a piece
    raise ArgumentError.new "This is not your piece!" if piece.color != color
    raise ArgumentError.new "There is no piece at starting position." if
      piece == null
    raise ArgumentError.new "You cannot move the piece there." if
      !in_bounds?(end_pos) || self[end_pos].color == color ||
      !piece.valid_moves.include?(end_pos)

    move_piece!(color, start_pos, end_pos)
    nil
  end

  def move_piece!(color, start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos], self[start_pos] = piece, null
    piece.pos = end_pos
  end

  def populate_board(fill)
    @null = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, null) }

    [:white, :black].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end if fill
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
