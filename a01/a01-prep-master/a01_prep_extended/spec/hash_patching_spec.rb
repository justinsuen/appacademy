require 'rspec'
# require_relative '../lib/hash_patching'
require_relative '../lib/hash_patching'

describe "my_each" do
  a = {"a"=> 1, "b" => 2, "c" => 3}
  res = ""
  a.my_each{|key, v| v.times{res << key}}

  it "Calls the proc on each key value pair" do
    expect(res.chars.sort).to eq(["a","b","b","c","c","c"])
  end
end

describe "my_merge" do
  a = {a: 1, b: 2, c: 3}
  b = {d: 4, e: 5}
  c = {c: 33, d: 4, e: 5}

  it "Merges 2 hashes and returns a hash" do
      expect(a.my_merge(b)).to eq(a.merge(b))
  end

  it "Priortizes values from the hash being merged in" do
      expect(a.my_merge(c)).to eq(a.merge(c))
  end
end
