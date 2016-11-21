require 'byebug'

def range(start, finish)
  return [] if finish < start

  [start] + range(start + 1, finish)
end

def range_it(start, finish)
  range = []
  (start..finish).each { |el| range << el }
  range
end

def exp_1(b, n)
  return 1 if n == 0

  b * exp_1(b, n - 1)
end

def exp_2(b, n)
  return 1 if n == 0
  return b if n == 1

  if n % 2 == 0
    mult = exp_2(b, n / 2)
    multiply_self(mult)
  else
    mult = exp_2(b, (n - 1) / 2)
    multiply_self(mult) * b
  end
end

def multiply_self(num)
  num * num
end

# # exp test
# p exp_2(2, 1)
# p exp_2(2, 0)
# p exp_2(2, 6)
# p exp_2(3, 3)

class Array
  def deep_dup
    res = []
    self.each do |el|
      if el.is_a?(Array)
        res << el.deep_dup
      else
        res << el
      end
    end

    res
  end
end

# deep_dup test
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
#
# robot_parts_copy = robot_parts.deep_dup
#
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# p robot_parts
# p robot_parts_copy

def fib(n)
  return [] if n <= 0
  return [1] if n == 1
  return [1, 1] if n == 2

  prev = fib(n - 1)
  two_prev = fib(n - 2)

  prev + [two_prev.last + prev.last]
end

def fib_it(n)
  res = [1, 1]

  (2...n).each do
    res << res[-1] + res[-2]
  end

  res
end

# # fib test
# p fib(10)

def permutations(array)
  res = []

  return array if array.length == 1

  array.each_with_index do |el, i|
    copy = array.dup
    copy.delete_at(i)
    permed = permutations(copy)
    permed.each { |p_arr| res << ([el] + [p_arr]).flatten }
  end

  res
end

# # permutations test
# p permutations([1, 2, 3, 4])

def bsearch(array, target)
  if array.length == 1
    return array[0] == target ? 0 : nil
  end

  mid_index = array.length / 2

  if target < array[mid_index]
    bsearch(array[0...mid_index], target)
  else
    right = bsearch(array[mid_index..-1], target)
    return nil if right == nil
    mid_index + right
  end
end

# # bsearch test
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length == 1
  mid_index = arr.length / 2

  left = merge_sort(arr[0...mid_index])
  right = merge_sort(arr[mid_index..-1])

  merge(left, right)
end

def merge(left, right)
  result_array = []

  until left == [] || right == []
    if left[0] > right[0]
      result_array << right.shift
    else
      result_array << left.shift

    end
  end

  result_array.concat(left).concat(right)
end

# # merge_sort test
# p merge_sort([1, 6, 5, 4, 1])
# p merge_sort([1, 6, 5, 4, 1, 132, 1564, 0, 8, 75])

def subsets(arr)
  return [[]] if arr == []

  copy = subsets(arr[0..-2]).dup
  copy.each { |el| el << arr.last }

  subsets(arr[0..-2]) + copy
end

# subsets test
# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  change_array = []

  return change_array if amount == 0
  coin = coins.find { |c| amount >= c }

  change_array << coin
  amount -= coin

  change_array + greedy_make_change(amount)
end

# greedy test
p greedy_make_change(39)
# p greedy_make_change(24, [10, 7, 1])

# def make_better_change(amount, coins = [25, 10, 5, 1])
#   # change_array = greedy_make_change(amount, coins)
#   # coins = coins[1..-1]
#   all_possible_solutions = []
#   change = []
#   until coins == []
#     coins.each do |c|
#       (amount / c).times { change << c }
#       amount = amount % c
#       p change
#     end
#     all_possible_solutions << change
#     change = []
#     coins.shift
#     p all_possible_solutions
#   end
# end

# ## IAN
#
# def make_better_change(amount, coins = [25, 10, 5, 1])
#   current_coins = []
#   best_coin_count = greedy_make_change(amount)
#
#
#   while current_coins.length < best_coin_count.length
#     coins.each do |coin|
#       if coin < amount
#         amount -= coin
#         current_coin_count << coin
#       end
#     end
#   end
# end

# better change test
p make_better_change(24, [10, 7, 1]) # => [10, 7, 7]
p make_better_change(14, [10, 7, 1]) # => [7, 7]
