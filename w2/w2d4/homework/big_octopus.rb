def slug_octo(arr)
  arr.each_with_index do |el, i|
    max_len = true
    arr.each_with_index do |el2, j|
      next if i == j
      max_len = false if el.length < el2.length
    end
    return el if max_len
  end
end

def dominant_octo(arr)
  merge_sort(arr).last
end

### Utility for dominant_octo
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
    if left[0].length > right[0].length
      result_array << right.shift
    else
      result_array << left.shift

    end
  end

  result_array.concat(left).concat(right)
end
###

def clever_octo(arr)
  longest = ""
  arr.each do |el|
    longest = el if el.length >= longest.length
  end
  longest
end
