require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require 'byebug'

class Game
  attr_reader :board, :player
  attr_accessor :previous_guess

  def initialize(board, player)
    @board = board
    @player = player
    @previous_guess = nil
  end

  def play
    player.get_board_size(board.length)

    until winner?
      system("clear")
      board.render

      pos = get_player_input
      make_guess(pos)
    end

    puts "You won!"
  end

  def hide_cards(guesses)
    guesses.each do |pos|
      board.grid[pos].hide
    end
  end

  def make_guess(pos)
    revealed_val = board.reveal(pos)
    player.receive_revealed_card(board.grid[pos], pos)
    board.render

    compare_guess(pos)

    # sleep(1)
    board.render
  end

  def compare_guess(new_guess)
    if previous_guess
      if match?(previous_guess, new_guess)
        player.receive_match(previous_guess, new_guess)
      else
        puts "Try again."
        [previous_guess, new_guess].each { |pos| board.grid[pos].hide }
      end
      @previous_guess = nil
      player.previous_guess = nil
    else
      @previous_guess = new_guess
      player.previous_guess = new_guess
    end
  end

  def get_player_input
    pos = nil

    until pos && valid_guess?(pos)
      pos = player.prompt
    end

    pos
  end

  def match?(pos1, pos2)
    board.grid[pos1] == board.grid[pos2]
  end

  def valid_guess?(guess)
    !board.grid[guess].face_up?
  end

  def winner?
    board.won?
  end
end

if $PROGRAM_NAME == __FILE__
  card1 = Card.new(1)
  card2 = Card.new(2)
  card3 = Card.new(3)

  board = Board.new(card1, card2, card3)

  game = Game.new(board, ComputerPlayer.new("Justin"))
  game.play
end
