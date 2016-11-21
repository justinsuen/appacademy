def quicksort(arr)
  return arr if arr.length <= 1
  pivot_arr = [arr[0]]

  right = arr[1..-1].select { |el| el >= arr[0] }
  left = arr[1..-1].select { |el| el < arr[0] }

  quicksort(left) + pivot_arr + quicksort(right)
end
