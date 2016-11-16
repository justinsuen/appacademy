def sum_to(n)
  if n < 0
    nil
  elsif n == 1
    1
  else
    n + sum_to(n-1)
  end
end

def add_numbers(nums_array = nil)
  nums_array[0] + add_numbers(nums_array[1..-1])
end
