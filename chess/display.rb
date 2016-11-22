require_relative "board"
require_relative "cursor"
require "colorize"
require "byebug"

class Display
  attr_reader :cursor, :board, :selected

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
    @selected = []
  end

  def build_display_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color = set_color(i, j)
      piece.to_s.colorize(color)
    end
  end

  def move(new_pos)
  end

  def render
    loop do
      system "clear"
      puts "Navigate using WASD keys."
      build_display_grid.each { |row| puts row.join("") }
      cursor.get_input

      sleep(0.5)
    end
  end

  def set_color(i, j)
    if (cursor.cursor_pos == [i, j] && cursor.selected) ||
      selected.include?([i, j])
      bg = :green
    elsif cursor.cursor_pos == [i, j]
      bg = :light_yellow
    elsif (i.even? && j.odd?) || (i.odd? && j.even?)
      bg = :blue
    else
      bg = :white
    end
    { background: bg }
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  disp = Display.new(b)
  disp.render
end
