require_relative "polytreenode"

class KnightPathFinder
  DELTAS = [[-2, 1], [-2, 1], [-1, -2], [-1, 2], [2, 1], [2, -1],
            [1, 2], [1, -2]]
  def initialize(start_pos)
    @curr_pos = start_pos
    @root = PolyTreeNode.new(start_pos)
    @moves = {}
    @visited_positions = [start_pos]
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    new_moves = valid_moves(pos).reject { |el| @visited_positions.include?(el) }
    @visited_positions.concat(new_moves)
    new_moves
  end

  def valid_moves(pos)
    row, col = pos
    DELTAS.map do |delta|
      x, y = delta
      if (row + x).between?(0, 8) && (col + y).between?(0, 8)
        [x + row, col + y]
      end
    end.reject(&:nil?)
  end
end
