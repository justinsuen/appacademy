class Ghost
  attr_accessor :fragment, :dict
  attr_reader :current_player, :previous_player

  def initialize(dictionary, player1, player2)
    @dict = File.readlines(dictionary) {|line| line.chomp}.to_set
    @current_player, @previous_player = Player.new(player1), Player.new(player2)
    @fragment = ""
  end

  def next_player!
    @current_player, @previous_player = previous_player, current_player
  end

end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end


end

if $PROGRAM_NAME == __FILE__
  game = Ghost.new("dictionary.txt","player1","player2")
end
