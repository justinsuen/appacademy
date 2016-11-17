class Board

  attr_accessor :grid, :size

  def self.empty_grid(size)
    Array.new(size) do
      Array.new(size) { Tile.new }
    end
  end

  def initialize(size = 9)
    @size = size
    @grid = self.empty_grid(size)
  end
end
