require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require 'byebug'

class Game
  attr_reader :board, :player

  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    player.get_board_size(board.length)

    until winner?
      system("clear")
      board.render

      guesses = []
      until guesses.length == 2
        guess = player.prompt
        if valid_guess?(guess)
          guesses << guess
          player.receive_revealed_card(board.grid[guess], guess)

          board.reveal(guesses.last)
          board.render
        else
          puts "Card already face up!"
        end
      end

      # sleep(2)
      if make_guess?(guesses)
        player.receive_match(guesses)
      else
        hide_cards(guesses)
      end
    end
    print "You won!"
  end

  def hide_cards(guesses)
    guesses.each do |pos|
      board.grid[pos].hide
    end
  end

  def make_guess?(guesses)
    first = board.reveal(guesses.first)
    last = board.reveal(guesses.last)
    first == last
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
  card4 = Card.new(4)

  board = Board.new(card1, card2, card3, card4)

  game = Game.new(board, ComputerPlayer.new("Justin"))
  game.play
end
