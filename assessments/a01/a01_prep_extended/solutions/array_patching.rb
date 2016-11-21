class Array

  def my_each(&prc)
    (0...size).each do |i|
      prc.call(self[i])
    end

    self
  end

  def my_each_with_index(&prc)
    (0...size).each do |idx|
      prc.call(self[idx], idx)
    end

    self
  end

  def my_select(&prc)
    select = []

    self.my_each{|el| select << el if prc.call(el)}
    select
  end

  def my_reject(&prc)
    self.dup - my_select(&prc)
  end

  def my_any?(&prc)
    my_each{|el| return true if prc.call(el)}
    false
  end

  def my_all?(&prc)
    my_each{|el| return false unless prc.call(el)}
    true
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
      el.is_a?(Array) ? flattened += el.my_flatten : flattened << el
    end
    flattened
  end

  def my_controlled_flatten(n)
    return self if n < 1
    result = []

    each do |el|
      if el.is_a?(Array)
        result += el.my_controlled_flatten(n-1)
      else
        result << el
      end
    end

    result
  end

  def my_zip(*arrs)
    result = []
    (0...size).each do |idx|
      result << [self[idx]]
      arrs.each do |arr|
        result[idx] << arr[idx]
      end
    end

    result
  end

  def my_rotate(num=1)
    rotations = num % size
    rotated_arr = self.dup

    rotations.times do
      rotated_arr << rotated_arr.shift
    end

    rotated_arr
  end

  def my_join(str = "")
    res = ""
    my_each_with_index do |el, i|
      res << el.to_s
      res << str unless i == size - 1
    end

    res
  end

  def my_reverse
    reversed = []
    my_each{|el| reversed.unshift(el)}
    reversed
  end

  def my_quick_sort(&prc)
    prc ||= proc {|a, b| a<=>b}
    return self if size < 2

    pivot = first
    left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
    right = self[1..-1].select{|el| prc.call(el, pivot) != -1}

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  def my_bsearch(target, &prc)
    return nil if size == 0
    prc ||= proc {|a, b| a <=> b}

    mid = size/2

    case prc.call(self[mid], target)
    when 0
      return mid
    when 1
      return self.dup.take(mid).my_bsearch(target, &prc)
    else
      search_res = self.dup.drop(mid+1).my_bsearch(target, &prc)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end

end
