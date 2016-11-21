require_relative 'tic_tac_toe'
# require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos #:my_mark
  attr_accessor :children
  MARKS = [:x, :o]

  def initialize(board = Board.new, next_mover_mark = MARKS[0], prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    # @my_mark = next_mover_mark == :x ? MARKS[1] : MARKS[0]
    @prev_move_pos = prev_move_pos
    # @children = []
  end

  def losing_node?(evaluator)
    if board.over?
      return board.won? && board.winner != evaluator
    elsif next_mover_mark == evaluator
      return children.all? { |child| child.losing_node?(evaluator) }
    else
      return children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      board.winner == evaluator
    elsif next_mover_mark == evaluator
      children.any? { |child| child.winning_node?(evaluator) }
    else
      children.all? { |node| node.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_tiles = get_empty_tiles
    children = []
    empty_tiles.each do |position|
      test_board = @board.dup
      test_board[position] = @next_mover_mark
      next_mark = @next_mover_mark == :x ? MARKS[1] : MARKS[0]
      next_node = TicTacToeNode.new(test_board, next_mark, position)
      children << next_node
    end

    children
  end

  def get_empty_tiles
    empty_tiles = []
    # debugger
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |_, j|
        empty_tiles << [i, j] if @board.empty?([i, j])
      end
    end

    empty_tiles
  end

  # def dfs_find_winner?(target_value)
  #   return true if board.winner == target_value
  #
  #   children.each do |node|
  #     current = node.dfs_find_winner?(target_value)
  #     return current if current
  #   end
  #
  #   false
  # end
end
