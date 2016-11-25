class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_val = 0
    self.each_with_index do |num, i|
      hash_val += num.hash * (i + 1)
    end
    hash_val
  end
end

class String
  def hash
    self.split("").map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_val = 0
    self.each do |k, v|
      hash_val += k.hash + (v.hash * 2)
    end
    hash_val
  end
end
