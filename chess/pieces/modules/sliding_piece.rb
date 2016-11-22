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
      moves.concat(generate_moves(x, y))
    end
    moves
  end

  def generate_moves(dx, dy)
    pos = [self.pos[0] + dx, self.pos[1] + dy]

    if board.valid_move?(pos) &&
      (board.empty?(pos) || board[pos].color != color)
      return pos
    end

    []
  end
end
