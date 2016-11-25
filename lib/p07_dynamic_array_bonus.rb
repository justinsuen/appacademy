class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if count + i < 0
    i < 0 ? @store[count + i] : @store[i]
  end

  def []=(i, val)
    return nil if count + i < 0
    if i > count
      until count == i + 1
        self.push(nil)
      end
    end

    i < 0 ? @store[count + i] = val : @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    (0...@count).each do |i|
      return true if val == self[i]
    end
    false
  end

  def push(val)
    @count += 1
    resize! if count > capacity
    self[count - 1] = val
  end

  def unshift(val)
    arr = StaticArray.new(@count * 2)
    arr[0] = val
    (0...@count).each do |i|
      arr[i + 1] = self[i]
    end
    @store = arr
  end

  def pop
    return nil if @count.zero?
    @count -= 1
    val = self[count]
    self[count] = nil
    val
  end

  def shift
    return nil if @count.zero?
    val = self[0]
    (1...count).each do |i|
      self[i - 1] = self[i]
    end
    self[count - 1] = nil
    @count -= 1
    val
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each
    (0...@count).each do |i|
      yield self[i]
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
    return false if other.count != self.count
    (0...count).each do |i|
      return false if self[i] != other[i]
    end
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    arr = StaticArray.new(capacity * 2)
    (0...capacity).each do |i|
      arr[i] = self[i]
    end
    @store = arr
  end
end
