class Tile

  attr_reader :tile, :bomb

  def initialize(bomb = false)
    @bomb = bomb
  end

end
