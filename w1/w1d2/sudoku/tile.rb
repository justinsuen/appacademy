require 'colorize'
require 'colorized_string'

class Tile
  attr_reader :value, :given

  def initialize(value = 0, given = false)
    @value = value
    @given = given
  end

  def given?
    @given
  end

  def color
    given? ? :blue : :red
  end

  def to_s
    value == 0 ? " " : value.to_s.colorize(:green)
  end

  def value=(new_value)
    if given?
      puts "You can't change a given value."
    else
      @value = new_value
    end
  end
end
