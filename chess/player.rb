require_relative "display"

class Player
  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move
  end
end

class HumanPlayer < Player
  def initialize(color, display)
    super(color, display)
  end

  def make_move
  end
end

class ComputerPlayer < Player
  def initialize(color, display)
    super(color, display)
  end

  def make_move
  end
end
