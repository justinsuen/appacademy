# O(n! * n)
def first_anagram?(word1, word2)
  letters1 = word1.split('').permutation.to_a # O(n!)
  anagrams1 = letters1.map(&:join) # O(n! * n)

  anagrams1.include?(word2) # O(n!)
end

# p first_anagram?("gizmo", "sally") # => false
# p first_anagram?("elvis", "lives") # => true

# O(n^2)
def second_anagram?(word1, word2)
  letters1 = word1.split('')
  letters2 = word2.split('')
  l1_dup = letters1.dup
  l2_dup = letters2.dup

  delete_count = 0
  letters1.each_with_index do |letter, index|
    index2 = l2_dup.index(letter)
    if index2
      l1_dup.delete_at(index - delete_count)
      l2_dup.delete_at(index2)
      delete_count += 1
    end
  end

  l1_dup.empty? && l2_dup.empty?
end

# p second_anagram?("gizmo", "sally") # => false
# p second_anagram?("elvis", "lives") # => true
# p second_anagram?("elvisuitbn", "elitbnvisu") # => true

# O(n log n)
def third_anagram?(word1, word2)
  sorted1 = word1.split('').sort
  sorted2 = word2.split('').sort

  sorted1 == sorted2
end

# p third_anagram?("gizmo", "sally") # => false
# p third_anagram?("elvis", "lives") # => true
# p third_anagram?("elvisuitbn", "elitbnvisu") # => true


def fourth_anagram?(word1, word2)
  w1 = Hash.new(0)
  w2 = Hash.new(0)

  word1.split('').each do |char|
    w1[char] += 1
  end

  word2.split('').each do |char|
    w2[char] += 1
  end

  w1.each do |char, count|
    return false unless count == w2[char]
  end

  w2.each do |char, count|
    return false unless count == w1[char]
  end

  true
end

# p  fourth_anagram?("gizmo", "sally") # => false
# p  fourth_anagram?("elvis", "lives") # => true
# p  fourth_anagram?("elvisuitbn", "elitbnvisu") # => true

def fifth_anagram?(word1, word2)
  w = Hash.new(0)

  word1.split('').each do |char|
    w[char] += 1
  end

  word2.split('').each do |char|
    w[char] -= 1
  end

  w.all? { |_, v| v == 0 }
end

p  fifth_anagram?("gizmo", "sally") # => false
p  fifth_anagram?("elvis", "lives") # => true
p  fifth_anagram?("elvisuitbn", "elitbnvisu") # => true
