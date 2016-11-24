def bad_my_min(arr)
  arr.each do |el|
    min_num = true
    arr.each do |el2|
      min_num = false if el > el2
    end
    return el if min_num
  end
end

# test
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p bad_my_min(list)

def good_my_min(arr)
  smallest = arr.first
  arr.each do |el|
    smallest = el if el < smallest
  end
  smallest
end

# test
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p good_my_min(list)

def bad_contig_subsum(arr)
  # n! || n^3 ?
  sub_arrays = []
  arr.each_index do |i|
    (i...arr.length).each do |j|
      sub_arrays << arr[i..j]
    end
  end

  # above * n^2 ?  << bottleneck
  max = sub_arrays.first.inject(&:+)
  sub_arrays.each do |sub_arr|
    sub_sum = sub_arr.inject(&:+)
    max = sub_sum if sub_sum > max
  end
  max
end

# test
# list = [5, 3, -7]
# p bad_contig_subsum(list) # => 8
# list = [2, 3, -6, 7, -6, 7]
# p bad_contig_subsum(list) # => 8
# list = [-5, -1, -3]
# p bad_contig_subsum(list) # => -1



def better_contig_subsum(arr)
  max_sum = arr.inject(&:+) # O(n)
  temp_sum = max_sum

  loop do # O(n)
    left = temp_sum - arr.first
    right = temp_sum - arr.last

    if arr.length == 1
      if arr.first > max_sum
        return arr.first
      else
        return max_sum
      end
    end

    if right >= left
      max_sum = right if right >= max_sum
      temp_sum = right
      arr.pop
    else
      max_sum = left if left >= max_sum
      temp_sum = left
      arr.shift
    end
  end

  max_sum
end

# test
list = [5, 3, -7]
p better_contig_subsum(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p better_contig_subsum(list) # => 8
list = [-5, -1, -3]
p better_contig_subsum(list) # => -1
