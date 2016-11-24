class Array
  def my_uniq
    res = []
    self.each { |el| res << el unless res.include?(el) }
    res
  end

  def two_sum
    res = []
    self.each_with_index do |el, i|
      ((i + 1)...self.length).each do |j|
        res << [i, j] if el + self[j] == 0
      end
    end
    res
  end

  def my_transpose
    res = Array.new(self[1].length) { Array.new(self.length) }
    self.each_with_index do |row, i|
      row.each_with_index do |col, j|
        res[j][i] = col
      end
    end
    res
  end
end

def stock_picker(prices)
  res = []
  max_diff = 0
  prices.each_with_index do |start_price, i|
    ((i + 1)...prices.length).each do |j|
      if prices[j] - start_price > max_diff
        res = [i, j]
        max_diff = prices[j] - start_price
      end
    end
  end
  res
end
