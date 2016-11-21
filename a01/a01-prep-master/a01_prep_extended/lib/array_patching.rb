require 'byebug'
class Array

  def my_each(&prc)
    i = 0
    while i < self.count
      prc.call(self[i])
      i += 1
    end
  end

  def my_each_with_index(&prc)
    i = 0
    while i < self.count
      prc.call(self[i], i)
      i += 1
    end
  end

  def my_select(&prc)
    res = []
    self.my_each { |el| res << el if prc.call(el) }
    res
  end

  def my_reject(&prc)
    res = []
    self.my_each { |el| res << el unless prc.call(el) }
    res
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false unless prc.call(el) }
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    res = []
    self.my_each do |el|
      el.is_a?(Array) ? res += el.my_flatten : res << el
    end
    res
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    res = []
    self.my_each do |el|
      if el.is_a?(Array) && n > 0
        res += el.my_controlled_flatten(n - 1)
      else
        res << el
      end
    end
    res
  end

  def my_zip(*arrs)
    res = []
    self.my_each_with_index do |el, i|
      temp_arr = [el]
      arrs.my_each do |arr|
        temp_arr << arr[i] || nil
      end
      res << temp_arr
    end
    res
  end

  def my_rotate(num = 1)
    self[(num % length)..-1] +self[0...(num % length)]
  end

  def my_join(str = "")
    res = ""
    self.my_each_with_index do |el, i|
      i < length - 1 ? res += el + str : res += el
    end
    res
  end

  def my_reverse
    res = []
    self.my_each do |el|
      res.unshift(el)
    end
    res
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new { |a,b| a <=> b }
    return self if length < 2

    pivot = self.first
    left = self[1..-1].select { |el| prc.call(el, pivot) == -1 }
    right = self[1..-1].select { |el| prc.call(el, pivot) != -1 }

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    return nil if length == 0
    prc ||= Proc.new { |a,b| a <=> b }

    mid = length / 2

    case prc.call(self[mid], target)
    when 0
      return mid
    when 1
      return self[0...mid].my_bsearch(target, &prc)
    else
      res = self[(mid + 1)..-1].my_bsearch(target, &prc)
      res.nil? ? nil : mid + res + 1
    end
  end

end
