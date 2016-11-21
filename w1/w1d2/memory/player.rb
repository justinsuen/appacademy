require_relative 'card.rb'
require_relative 'board.rb'

class HumanPlayer
  attr_reader :name
  attr_accessor :previous_guess

  def initialize(name)
    @name = name
  end

  def get_board_size(size)
  end

  def prompt
    print "#{name}, guess a position: "
    gets.chomp.to_i
  end

  def receive_revealed_card(card, pos)
  end

  def receive_match(pos1, pos2)
  end
end

class ComputerPlayer
  attr_reader :name, :board_size
  attr_accessor :known_cards, :matched_cards,
    :known_guess, :previous_guess

  def initialize(name)
    @name = name
    @known_cards = {}
    @matched_cards = {}
    @previous_guess = nil
  end

  def prompt
    guess_logic
  end

  def get_board_size(size)
    @board_size = size
  end

  def receive_revealed_card(card, pos)
    @known_cards[pos] = card.face_value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end

  def guess_logic
    if previous_guess
      second_guess
    else
      first_guess
    end
  end

  def first_guess
    unmatched_card || choose_random
  end

  def second_guess
    matched_card || choose_random
  end

  def unmatched_card
    (pos, _) = @known_cards.find do |pos, val1|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val1 == val2) &&
          !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end

    pos
  end

  def matched_card
    (pos, _) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] &&
        !@matched_cards[pos]
    end

    pos
  end

  def choose_random
    guess = nil

    until guess && !@known_cards[guess]
      guess = rand(@board_size)
    end

    guess
  end
end
