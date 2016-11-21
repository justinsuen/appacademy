class Stack
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def add(el)
    ivar << el
  end

  def remove
    ivar.pop
  end

  def show
    ivar.dup
  end
end

class Queue
  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def enqueue(el)
    ivar << el
  end

  def dequeue
    ivar.shift
  end

  def show
    ivar.dup
  end
end
