class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    keys.each do |k|
      prc.call(k, self[k])
    end
  end
  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    self_dup = self.dup

    hash2.each do |k, v|
      self_dup[k] = v
    end

    self_dup
  end

end
