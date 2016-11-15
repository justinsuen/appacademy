require 'set'

class Ghost
  attr_accessor :fragment, :dict, :losses
  attr_reader :players
  MAX_LOSS_COUNT = 5

  def initialize(dictionary, *players)
    @dict = File.new(dictionary).readlines.map(&:chomp).to_set
    @players = players
    @players << AiPlayer.new("AI")
    @losses = Hash.new(0)
    players.each { |player| losses[player] = 0 }
  end

  def play_round
    @fragment = ""
    until @dict.include?(@fragment)
      take_turn
      next_player!
    end

    puts "#{previous_player.name}, you lose!"
    @losses[previous_player] += 1
    display_status

    puts "#{previous_player.name} is elimnated!" if @losses[previous_player] == 5
    next_player!
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def display_status
    @losses.each { |key, val| p "#{key.name} = #{val}" }
  end

  def play_game
    play_round until game_over?
    puts "#{winner.name} wins!"
  end

  def game_over?
    rem_players == 1
  end

  def rem_players
    @losses.count { |_, v| v < MAX_LOSS_COUNT }
  end

  def winner
    (player, _) = @losses.find { |_, l| l < MAX_LOSS_COUNT }
    player
  end

  def next_player!
    @players.rotate!
    @players.rotate! until @losses[current_player] < MAX_LOSS_COUNT
  end

  def take_turn
    if current_player.is_a?(Player)
      @fragment += current_player.guess(@fragment, @dict)
    else
      @fragment += current_player.guess(@fragment, @dict, @players.length)
    end
  end

end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment, dict)
    puts "Current fragment: #{fragment}" unless fragment == ""
    print "#{@name}, your turn: "

    begin
      guess_word = gets.chomp
      temp_frag = fragment + guess_word
      raise ArgumentError if alert_invalid_guess(temp_frag, dict)
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
    puts "Current fragment: #{temp_frag}" unless temp_frag == ""
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
  game = Ghost.new("dictionary.txt", Player.new("Justin"), Player.new("Kevin"))
  game.play_game
end
