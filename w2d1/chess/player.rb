require_relative "display"

class Player
  attr_reader :display

  def initialize(color, display)
    @color = color
    @display = display
  end
end

class HumanPlayer < Player
  def initialize(color, display)
    super(color, display)
  end

  def make_move(board)
    from, to = nil

    until from && to
      display.render
      move = display.cursor.get_input
      from ? to = move : from = move

      sleep(0.25)
    end

    [from, to]
  end
end

class ComputerPlayer < Player
  def initialize(color, display)
    super(color, display)
  end

  def make_move
  end
end
