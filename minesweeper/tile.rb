require 'colorize'

class Tile
  attr_reader :tile
  attr_accessor :bomb, :flag, :reveal

  def initialize(bomb = false)
    @bomb = bomb
    @reveal = false
    @flag = false
  end

  def bomb?
    bomb
  end

  def reveal?
    reveal
  end

  def flag?
    flag
  end

  def to_s
    if flag?
      char = "F".colorize(:blue)
    elsif reveal?
      char = bomb? ? "B".colorize(:red) : "_"
    else
      char = "*"
    end
    char
  end

end
