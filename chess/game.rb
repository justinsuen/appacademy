require_relative "board"
require_relative "player"
require_relative "display"

class Game
  attr_reader :board, :display, :curr_player, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: Player.new(:white, @display),
      black: Player.new(:black, @display)
    }
    @curr_player = :white
  end

  def play
    until board.check_mate?
      from, to = players[curr_player].make_move
      board.move_piece(@curr_player, from, to)
      swap_turn!
      notify_players
    end

    display.render
    puts "#{curr_player} won!"
  end

  private

  def notify_players
    puts "Current player is #{curr_player}"
  end

  def swap_turn!
    @curr_player = (@curr_player == :white) ? :black : :white
  end
end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
