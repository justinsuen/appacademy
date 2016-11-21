require_relative 'tile'

class Board

  DELTAS = [[-1, 1], [-1,0], [-1, -1], [0, -1],
            [0, 1], [1, 1], [1, 0], [1, -1]]

  attr_accessor :grid, :size

  def self.empty_grid(size)
    Array.new(size) do
      Array.new(size) { Tile.new }
    end
  end

  def initialize(size)
    @size = size
    @grid = Board.empty_grid(size)
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
    (0...(num_bombs**2)).to_a.sample(size)
  end

  def neighbors(pos)
    row, col = pos
    neighbor_pos = []

    DELTAS.each do |del|
      new_row = row + del[0]
      new_col = col + del[1]
      unless new_row < 0 || new_col < 0
        neighbor_pos << [new_row, new_col]
      end
    end

    neighbor_pos
  end

  def render
    puts "  #{(0...size).to_a.join(" ")}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end

  def flag(pos)
    row, col = pos
    tile = grid[row][col]

    tile.flag = true
  end

  def reveal(pos)
    row, col = pos
    grid[row][col].reveal = true
  end

  def reveal_all
    @grid.each do |row|
      row.each do |el|
        el.reveal = true
      end
    end
  end

  def game_over?
    popped_bomb? || !found_bombs?
  end

  def popped_bomb?
    @grid.flatten.any? { |el| el.bomb? && el.reveal? }
  end

  def found_bombs?
    @grid.flatten.any? { |el| !el.bomb? && !el.reveal? }
  end
end
