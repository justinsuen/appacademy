module SteppingPiece
  def moves
    possible_moves = []
    move_diff.each do |diff|
      dx, dy = diff
      move = generate_moves(dx, dy)
      possible_moves.concat([move]) if board.in_bounds?(move)
    end
    possible_moves
  end

  def generate_moves(dx, dy)
    [@pos[0] + dx, @pos[1] + dy]
  end
end
