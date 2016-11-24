class Hanoi
  attr_reader :stacks

  def initialize(stacks = [[3, 2, 1], [], []])
    @stacks = stacks
  end

  def render
    res = ""
    stacks.each_with_index do |stack, i|
      res += "Tower #{i}:  #{stack.join(' ')}\n"
    end

    res.chomp
  end

  def move(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      stacks[end_pos] << stacks[start_pos].pop
    end
  end

  def valid_move?(start_pos, end_pos)
    return true if stacks[end_pos].empty?
    return false if stacks[start_pos].empty?

    stacks[end_pos][-1] > stacks[start_pos][-1]
  end

  def won?
    if stacks[1] == [3, 2, 1] || stacks[2] == [3, 2, 1]
      return true
    end

    false
  end

  def play
    until won?
      puts render
      puts "Starting stack:"
      start_pos = gets.chomp.to_i
      puts "Ending stack:"
      end_pos = gets.chomp.to_i

      move(start_pos, end_pos)
    end

    puts "Congratulations, you won!"
  end
end

if __FILE__ == $PROGRAM_NAME
  h = Hanoi.new
  h.play
end
