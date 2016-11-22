module SteppingPiece
  def moves
    possible_moves = []
    move_diff.each do |diff|
      dx, dy = diff
      possible_moves.concat(generate_moves(dx, dy))
    end
    possible_moves
  end

  def generate_moves(dx, dy)
    possible_move = [@pos[0] + dx, @pos[1] + dy]
    return [possible_move] if board.valid_move?(possible_move)

    []
  end
end
