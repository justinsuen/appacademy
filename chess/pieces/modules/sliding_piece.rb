module SlidingPiece
  LINEAR_DIFF = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  DIAG_DIFF = [[1, 1], [1, -1], [-1, -1], [-1, 1]]

  def linear
    LINEAR_DIFF
  end

  def diag
    DIAG_DIFF
  end

  def moves
    moves = []
    move_dir.each do |x, y|
      moves.concat(make_moves(x, y))
    end
    moves
  end

  def make_moves(x, y)
    moves = []
    loop do
      pos = [pos[0] + x, pos[1] + y]
      break unless board.valid_move?(pos)

      if board.empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != color
      end
      break
    end
    moves
  end
end
