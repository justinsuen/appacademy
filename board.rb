class Board

  attr_accessor :grid, :size

  def self.empty_grid
    Array.new(size) do
      Array.new(size) { Tile.new }
    end
  end

  def initialize(size)
    @size = size
    @grid = self.empty_grid
  end

  def populate_grid
    bomb_indices = sample_bomb(size)
    bomb_indices.each do |index|
      row = index / size
      col = index % size
      @grid[row][col].bomb = true
    end
  end

  def sample_bomb(num_bombs)
    (0...(num_bombs**2)).to_a.sample(num_bombs)
  end

  def render
    puts "  #{(0...size).to_a.join(" ")}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end
end
