# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alphabet = ("a".."z").to_a
  split_str = str.split("")

  res = []
  split_str.each do |letter|
    alphabet.each_with_index do |_,index|
      if alphabet[index] == letter
        res << alphabet[(index+shift)%26]
      end
    end
    res << " " if letter == " "
  end
  res.join("")
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  digits = digital_root(num)
  res = 0
  loop do
    tmp_sum = 0
    digits.each do |num|
      tmp_sum += num
    end
    res += tmp_sum
    digits = digital_root(res)
    break if digits.length > 1
  end
  res
end

def digital_root_helper(num)
  res = []
  while num > 9
    res << num % 10
    num -= num % 10
  end
  res << num
  res
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  res = str.split("")
  if alphabet.nil?
    res.sort!
  else
    res.sort_by! do |el|
      alphabet.index(el)
    end
  end
  res.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    res = []
    start = 0
    self[start..-1].each_with_index do |num1, i|
      self[(i+1)..-1].each_with_index do |num2, j|
        res << [i, j+(i+1)] if num1 + num2 == 0
      end
      start += 1
    end
    res
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    res = []
    dictionary.each do |word|
      letters = self.split("")
      letters.each_with_index do |_, ind|
        res << word if letters[ind...(ind+word.length)].join("") == word
      end
    end
    res.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  fac = []
  i = 1
  while i <= num do
    fac << i if num % i == 0
    i += 1
  end
  fac
end
