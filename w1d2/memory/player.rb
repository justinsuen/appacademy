require_relative 'card.rb'
require_relative 'board.rb'

class HumanPlayer
  attr_reader :name

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

  def receive_match(matching_pos)
  end
end

class ComputerPlayer
  attr_reader :name, :board_size
  attr_accessor :known_cards, :matched_cards, :known_guess

  def initialize(name)
    @name = name
    @known_cards = Hash.new { |h, k| h[k] = [] }
    @matched_cards = []
  end

  def prompt
    guess_logic
  end

  def get_board_size(size)
    @board_size = size
  end

  # needs help :(
  def guess_logic
    if @known_guess
      guess = @known_cards[@known_guess].last
      @known_guess = nil
      return guess
    end

    @known_cards.each do |key, val|
      if val.length == 2 && not_matched?(val[0])
        known_guess = key
        return val[0]
      end
    end

    guess = choose_random
    guess
  end

  def not_matched?(pos)
    !matched_cards.include?(pos)
  end

  def choose_random
    res = []
    board_size.times do |i|
      res << i unless @known_cards.values.flatten.include?(i)
    end
    res.sample
  end

  def receive_revealed_card(card, pos)
    @known_cards[card.face_value] << pos
  end

  def receive_match(matching_pos)
    @matched_cards += matching_pos
  end
end
