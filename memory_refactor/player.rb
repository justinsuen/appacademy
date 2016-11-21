class HumanPlayer
  attr_accessor :previous_guess

  def initialize(size)
    @previous_guess = nil
  end

  def get_input
    prompt
    parse(STDIN.gets.chomp)
  end

  def prompt
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    print "> "
  end

  def parse(string)
    string.split(",").map { |x| Integer(x) }
  end

  def receive_revealed_card(pos, value)
    # duck typing
  end

  def receive_match(pos1, pos2)
    puts "It's a match!"
  end
end

class ComputerPlayer
  attr_accessor :previous_guess, :board_size

  def initialize(size)
    @board_size = size
    @matched_cards = {}
    @known_cards = {}
    @previous_guess = nil
  end

  def receive_revealed_card(pos,value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end

  def get_input
    if previous_guess
      second_guess
    else
      first_guess
    end
  end

  def unmatched_pos
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) &&
          !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end

    pos
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] &&
        !@matched_cards[pos]
    end

    pos
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

  def random_guess
    guess = nil

    until guess && !@known_cards[guess]
      guess = [rand(board_size), rand(board_size)]
    end

    guess
  end
end
