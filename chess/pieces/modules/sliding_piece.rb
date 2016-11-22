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
    possible_moves = []
    move_dir.each do |x, y|
      possible_moves.concat(generate_moves(x, y))
    end
    possible_moves
  end

  def generate_moves(dx, dy)
    curr_x, curr_y = pos
    possible_moves = []

    loop do
      curr_x += dx
      curr_y += dy
      pos = [curr_x, curr_y]

      break if !board.in_bounds?(pos)
      possible_moves << pos
    end

    possible_moves
  end
end
