require_relative "piece"

class Pawn < Piece
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def symbol
    if color == :black
      " #{"\u265F".encode('utf-8')} "
    else
      " #{"\u2659".encode('utf-8')} "
    end
  end

  def forward_dir
    color == :white ? -1 : 1
  end

  def moves
    forward_moves.concat(attack_moves)
  end

  def forward_moves
    curr_x, curr_y = pos
    possible_moves = []

    curr_x += forward_dir
    poss_move = [curr_x, curr_y]

    possible_moves << poss_move if board.in_bounds?(poss_move)

    possible_moves
  end

  def attack_moves
    curr_x, curr_y = pos

    right = [curr_x + forward_dir, curr_y + 1]
    left = [curr_x + forward_dir, curr_y -1]

    [right, left].select do |el|
      board.in_bounds?(el) && board[el].color != color
    end
  end
end
