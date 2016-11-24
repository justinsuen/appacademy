def brute_two_sum?(arr, target_sum)
  pairs = []
  arr.each_with_index do |el, i|
    ((i + 1)...arr.length).each do |j|
      pairs << [el, arr[j]]
    end
  end

  pairs.any? { |pair| pair[0] + pair[1] == target_sum }
end

# arr = [0, 1, 5, 7]
# p brute_two_sum?(arr, 6) # => should be true
# p brute_two_sum?(arr, 10) # => should be false

def sort_two_sum?(arr, target_sum)
  arr.sort!
  arr.each_with_index do |el, i|
    arr_dup = arr.dup
    arr_dup.delete_at(i)

    return true if arr_dup.bsearch { |x| target_sum - el - x }
  end

  false
end

# arr = [19, 12, 0, 5, 6, 2, 10]
# p sort_two_sum?(arr, 7) # => should be true
# p sort_two_sum?(arr, 3) # => should be false
#
# arr = [19, 12, 0, -5, -6, -2, -10]
# p sort_two_sum?(arr, 7) # => should be true
# p sort_two_sum?(arr, 18) # => should be false


def hash_map_two_sum?(arr, target_sum)
  hash_map = {}

  arr.each do |el|
    hash_map[el] = true
  end

  arr.each do |el|
    return true if hash_map[target_sum - el] && target_sum - el != el
  end

  false
end

arr = [19, 12, 0, 5, 6, 2, 10]
p hash_map_two_sum?(arr, 7) # => should be true
p hash_map_two_sum?(arr, 3) # => should be false

arr = [19, 12, 0, -5, -6, -2, -10]
p hash_map_two_sum?(arr, 7) # => should be true
p hash_map_two_sum?(arr, 18) # => should be false

arr = [7, 3, 4]
p hash_map_two_sum?(arr, 14) # => should be false
