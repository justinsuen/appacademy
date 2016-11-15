class Array
  def my_each(&prc)
    i = 0
    while i < length #instead of while loop can use self.length.times
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    res = []

    self.my_each do |i|
      res << i if prc.call(i)
    end

    res
  end

  def my_reject(&prc)
    res = []

    self.my_each do |i|
      res << i unless prc.call(i)
    end

    res
  end

  def my_any?(&prc)
    self.my_each do |i|
      return true if prc.call(i)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |i|
      return false unless prc.call(i)
    end

    true
  end

  def my_flatten
    res = []

    self.my_each do |i|
      if i.is_a?(Array)
        res.concat(i.my_flatten)
      else
        res << i
      end
    end

    res
  end

  def my_zip(*args)
    res = []

    self.length.times do |idx|
      temp = [self[idx]]

      args.my_each do |a|
        temp << a[idx]
      end

      res << temp
    end

    res
  end

  def my_rotate(rot = 1)
    rot = rot % length
    self[rot..-1] + self[0...rot]
  end

  def my_join(sep = "")
    res = ""

    self.my_each do |c|
      res += c
      res += sep unless self.last == c
    end

    res
  end

  def my_reverse
    res = []

    self.my_each { |el| res.unshift(el) }

    res
  end
end
