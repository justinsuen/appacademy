require 'set'

class Ghost
  attr_accessor :fragment, :dict, :losses
  attr_reader :current_player, :previous_player, :players

  def initialize(dictionary, *players)
    @dict = File.new(dictionary).readlines.map(&:chomp).to_set
    @players = players.map { |name| Player.new(name) }
    @players << AiPlayer.new("AI")
    @current_player = @players[1]
    @previous_player = @players[0]
    @fragment = ""
    @losses = Hash.new(0)
  end

  def play_round
    until @dict.include?(@fragment)
      take_turn
      next_player!
    end

    puts "#{@previous_player.name}, you lose!"
    @losses[@previous_player.name] += 1
    display_status
  end

  def display_status
    @losses.each { |key, val| p "#{key} = #{val}" }
  end

  def play_game
    until @losses.values.max == 5
      play_round
      @fragment = ""
    end
    puts "#{@previous_player.name}, you lost 5 games!"
    @players.shift
    @losses.delete(@previous_player.name)
    next_player!

    if @players.length > 1
      play_game
    else
      puts "#{@players[0].name} wins!"
    end
  end

  def next_player!
    @players = @players.push(@players.shift)
    @current_player = players[1]
    @previous_player = players[0]
  end

  def take_turn
    if @current_player.is_a?(Player)
      @fragment += @current_player.guess(@fragment, @dict)
    else
      @fragment += @current_player.guess(@fragment, @dict, @players.length)
    end
  end

end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment, dict)
    puts "Current fragment: #{fragment}"
    print "#{@name}, your turn: "

    begin
      guess_word = gets.chomp
      temp_frag = fragment + guess_word
      raise "Will not make word" if alert_invalid_guess(temp_frag, dict)
    rescue
      print "Guess again: "
      retry
    end

    guess_word
  end

  def alert_invalid_guess(temp_frag, dict)
    p temp_frag
    dict.none? { |word| word.start_with?(temp_frag) }
  end
end

class AiPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(temp_frag, dict, n)
    puts "Current fragment: #{temp_frag}"
    puts "#{@name} played"

    possible_moves = dict.select { |word| word.start_with?(temp_frag) }
    possible_moves.each do |word|
      if word.length - temp_frag.length < n
        new_frag = temp_frag + word[temp_frag.length]
        if possible_moves.all? { |w| w.length - new_frag.length < n }
          return word[temp_frag.length]
        end
      end
    end
    possible_moves.sample[temp_frag.length]
  end


end



if $PROGRAM_NAME == __FILE__
  game = Ghost.new("dictionary.txt", "player1", "player2")
  game.play_game
end
