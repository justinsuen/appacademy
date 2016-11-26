def naive_windowed_range(array, window_size)
  current_max_range = nil

  array.each_with_index do |el, i|
    end_index = i + window_size - 1
    break if end_index >= array.length
    sub_sorted = array[i..end_index].sort

    temp_range = sub_sorted.last - sub_sorted.first
    if current_max_range.nil? || temp_range > current_max_range
      current_max_range = temp_range
    end
  end

  current_max_range
end

p naive_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
