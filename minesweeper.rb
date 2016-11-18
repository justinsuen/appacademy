require_relative 'board'

class MinesweeperGame
  attr_reader :board

  def initialize(size = 9)
    @board = Board.new(size)
  end

  def play
    @board.populate_grid
    @board.render

    until game_over?
      com = get_command
      pos = get_pos
      do_command(com, pos)
    end
  end

  def get_command
    puts "what do you want to do? (f, r)"
    gets.chomp
  end

  def get_pos
    puts "input pos"
    gets.chomp.split(",")
  end

  def do_command(com, pos)
    case com
    when "f"
      board.flag(pos)
    when "r"
      board.reveal(pos)
    else
      puts "invalid command"
    end
  end

  def game_over?
    board.game_over?
  end
end

game = MinesweeperGame.new(9)
game.play
