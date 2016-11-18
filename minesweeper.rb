class MinesweeperGame
  attr_reader :board

  def initialize(size = 9)
    @board = Board.new(size)
  end

  def play
    board.populate_grid
    board.render
  end
end

game = MinesweeperGame.new(9)
game.play
