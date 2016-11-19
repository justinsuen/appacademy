require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    # next_mover_mark = mark == :x ? :o : :x
    node = TicTacToeNode.new(game.board, mark)
    child_arr = node.children
    
    child_arr.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      end
    end

    child_arr.each do |child|
      if !child.losing_node?(mark)
        return child.prev_move_pos
      end
    end
    # non_losing_moves = child_arr.reject { |child| child.losing_node?(mark) }
    # non_losing_moves.sample.prev_move_pos
    raise "No moves" if non_losing_moves.empty?
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
