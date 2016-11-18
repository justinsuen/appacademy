require_relative "polytreenode"

class KnightPathFinder
  DELTAS = [[-2, 1], [-2, 1], [-1, -2], [-1, 2], [2, 1], [2, -1],
            [1, 2], [1, -2]]

  attr_reader :curr_pos, :visited_positions, :moves

  def initialize(start_pos)
    @curr_pos = start_pos
    @root = PolyTreeNode.new(start_pos)
    @moves = {}
    @visited_positions = [start_pos]
  end

  def build_move_tree
    new_moves = new_move_positions(@curr_pos)
    new_moves.each do |move|
      @moves[move] = @root
    end

    until new_moves.empty?
      current_move = PolyTreeNode.new(new_moves.shift)
      current_move.parent = @moves[current_move.value]
      next_moves = new_move_positions(current_move.value)

      next_moves.each { |next_move| @moves[next_move] = current_move }

      new_moves.concat(next_moves)
    end

    @root
  end

  def new_move_positions(pos)
    new_moves = valid_moves(pos).reject { |el| @visited_positions.include?(el) }
    new_moves.each do |el|
      @visited_positions << el unless @visited_positions.include?(el)
    end
    new_moves
  end

  def valid_moves(pos)
    row, col = pos
    DELTAS.map do |delta|
      x, y = delta
      if (row + x).between?(0, 7) && (col + y).between?(0, 7)
        [x + row, col + y]
      end
    end.reject(&:nil?)
  end
end
