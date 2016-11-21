class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    prc ||= Proc.new { |a,b| a <=> b }
    return [] if self == []
    res = self.dup

    res.each_with_index do |bubble, i|
      res.each_with_index do |el, j|
        if prc.call(bubble, el) == -1
          res[i], res[j] = res[j], res[i]
        end
      end
    end

    res
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

  end
end

# Write a method that will transpose a rectangular matrix (array of arrays)
def transpose(matrix)
  return nil if matrix == []
  res = Array.new(matrix[1].length) { Array.new(matrix.length) }

  res.each_with_index do |row, i|
    row.each_with_index do |col, j|
      res[i][j] = matrix[j][i]
    end
  end

  res
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  return 0 if nums.length == 0
  nums[0] + sum_rec(nums.drop(1))
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    self_words = self.split(" ").sort
    other_words = other.split(" ").sort
    return false if self_words.length != other_words.length

    self_words.each do |s_word|
      if other_words.include?(s_word)
        self_words.delete(s_word)
        other_words.delete(s_word)
      end
    end

    return self_words == other_words
  end
end

# Write a method that returns the largest prime factor of a number
def largest_prime_factor(num)
  return nil if num == 0 || num == 1

  largest = 0

  (2..num).each do |el|
    largest = el if prime?(Integer(el)) && num % Integer(el) == 0
  end

  largest
end

# You are not required to implement this; it's here as a suggestion :-)
def prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an array method that returns an array made up of the
  # elements in the array that return `true` from the given block
  def my_select(&prc)
    res = []
    self.my_each do |el|
      res << el if prc.call(el)
    end
    res
  end
end
