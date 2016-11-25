class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
    @next = nil
    @prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    each do |link|
      return false if link.key
    end
    true
  end

  def get(key)
    cur_link = first
    until cur_link == @tail
      return cur_link.val if cur_link.key == key
      cur_link = cur_link.next
    end
    nil
  end

  def include?(key)
    cur_link = first
    until cur_link == @tail
      return true if cur_link.key == key
      cur_link = cur_link.next
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    prev_link = @tail.prev

    prev_link.next = new_link
    new_link.prev = prev_link

    new_link.next = @tail
    @tail.prev = new_link
  end

  def update(key, val)
    cur_link = first
    until cur_link == @tail
      if cur_link.key == key
        cur_link.val = val
        break
      end
      cur_link = cur_link.next
    end
  end

  def remove(key)
    cur_link = first
    until cur_link == @tail
      if cur_link.key == key
        prev_link = cur_link.prev
        next_link = cur_link.next

        prev_link.next = next_link
        next_link.prev = prev_link

        break
      end
      cur_link = cur_link.next
    end
  end

  def each(&blk)
    cur_link = first
    until cur_link == @tail
      blk.call(cur_link)
      cur_link = cur_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
