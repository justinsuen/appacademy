require 'colorize'

class Tile

  CHARS = {
    :bomb       => "B",
    :flag       => "F",
    :unexplored => "*",
    :empty      => "_"
  }

  DELTAS = [[-1, 1], [-1,0], [-1, -1], [0, -1],
            [0, 1], [1, 1], [1, 0], [1, -1]]

  attr_reader :tile, :bomb, :reveal

  def initialize(bomb = false)
    @bomb = bomb
    @reveal = false
  end

  def bomb?
    bomb
  end

  def reveal?
    reveal
  end

  def to_s
    char = bomb? ? "B".colorize(:red) : " "
  end

end
