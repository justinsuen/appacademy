class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    puts "Watch closely!"
    sleep(1)
    system('clear')

    add_random_color
    seq.each do |color|
      puts color
      sleep(0.75)
      system('clear')
      sleep(0.25)
    end
  end

  def require_sequence
    puts "Enter the sequence"
    seq.each do |color|
      guess = gets.chomp
      if guess != color
        @game_over = true
        break
      end
    end
    sleep(0.25)
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "You matched the sequence!"
  end

  def game_over_message
    puts "Game over! You made it through #{sequence_length - 1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
