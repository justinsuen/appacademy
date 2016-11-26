class StackQueue
  def initialize(window_size)
    @window_size = window_size
    @left_stack = MyStack.new
    @right_stack = MyStack.new
  end

  def enqueue(el)
    if @left_stack.size < window_size
      @left_stack.push(el)
    else
      window_size.times do
        @right_stack.push(@left_stack.pop)
      end
      @left_stack.push(el)
      @right_stack.pop
    end
  end

  def dequeue
  end

  def peek
    @right_stack.peek
  end

  def size

  end

  def empty?
    @left_stack.empty? && @right_stack.empty?
  end
end
