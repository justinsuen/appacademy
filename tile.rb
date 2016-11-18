require 'colorize'

class Tile

  CHARS = {
    :bomb       => "B",
    :flag       => "F",
    :unexplored => "*",
    :empty      => "_"
  }

  attr_reader :tile, :reveal
  attr_accessor :bomb

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
    if reveal?
      char = bomb? ? "B".colorize(:red) : "_"
    else
      char = "*"
    end
    char
  end

end
