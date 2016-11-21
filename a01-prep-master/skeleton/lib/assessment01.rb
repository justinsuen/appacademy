require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &blk)
    accumulator ||= self.shift
    self.each do |el|
      accumulator = blk.call(accumulator, el)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).none? { |n| num % n == 0 }
end

def primes(num)
  res = []
  i = 2

  until res.length == num
    res << i if is_prime?(i)
    i += 1
  end

  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  facs = factorials_rec(num - 1)
  facs << facs.last * (num - 1)
  facs
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    element_loc = Hash.new { |h, k| h[k] = [] }

    self.each_with_index { |el, i| element_loc[el] << i }

    element_loc.select { |k, v| v.length > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    res = []
    self.length.times do |start_pos|
      (2..(length - start_pos)).each do |len|
        substring = self[start_pos...(start_pos + len)]
        res << substring if substring == substring.reverse
      end
    end

    res
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    mid_index = self.length / 2

    left = self[0...mid_index].merge_sort(&prc)
    right = self[mid_index..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    res = []

    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) == 1
        res << right.shift
      else
        res << left.shift
      end
    end

    res.concat(left).concat(right)
  end
end
