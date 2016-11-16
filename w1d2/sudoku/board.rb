require_relative 'tile.rb'
require 'byebug'

class Board
  attr_reader :grid

  def initialize(lines)
    @grid = []
    populate_board(lines)
  end

  def populate_board(lines)
    lines.each do |line|
      grid_line = []
      line.each_char do |i|
        if i == "0"
          grid_line << Tile.new
        else
          grid_line << Tile.new(i.to_i, true)
        end
      end
      @grid << grid_line
    end
  end

  def render
    grid.each do |row|
      row_visual = ""
      row.each do |tile|
        row_visual += " #{tile}"
      end
      puts row_visual
    end
  end

  def solved?
    rows = grid.all? do |row|
      check_row?(row)
    end

    cols = grid.transpose.all? do |col|
      check_row?(col)
    end



    if rows && cols
      true
    else
      false
    end
  end

  def check_block?(row, col)


  end

  def check_row?(row)
    return false if row.any? { |i| i == 0 }
    return false unless row.uniq.length == 9

    true
  end

  def update_tile(pos, value)
    self[pos] = value
  end

  def valid_move?(move)
    return false if move > 9 || move < 1
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def self.from_file(file)
    lines = File.readlines(file).map(&:chomp)
    Board.new(lines)
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.from_file("sudoku1-solved.txt")
  board.render
  #board.update_tile([0, 1], 2)
  #puts ""
  #board.render
  p board.solved?
end
