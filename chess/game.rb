require_relative "board"
require_relative "player"
require_relative "display"

class Game
end


if __FILE__ == $PROGRAM_NAME
  b = Board.new
  disp = Display.new(b)
  game = Game.new(disp)
  game.play
end
