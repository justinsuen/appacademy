require 'rspec'
require 'spec_helper'
require 'a01'

describe "#bubble_sort" do
  # write a new `Array#bubble_sort` method; it should not modify the
  # array it is called on, but creates a new sorted array.
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].bubble_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort).to eq(array.sort)
  end

  it "will use block if given" do
    sorted = array.bubble_sort do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

describe 'transpose' do
  let(:arr) { [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
    ] }
  let(:small_arr) { [
    [1, 2],
    [3, 4]
    ] }
  let(:rect_arr) { [
    [1, 2, 3],
    [4, 5, 6]
    ] }
  let(:tall_rect_arr) { [
    [1, 2],
    [3, 4],
    [5, 6]
    ] }

  it 'should transpose a matrix' do
    expect(transpose(arr)).to eq([
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9]
      ])
  end

  it 'should transpose a matrix of a different size' do
    expect(transpose(small_arr)).to eq([
      [1, 3],
      [2, 4]
      ])
  end

  it 'should transpose a rectangular matrix' do
    expect(transpose(rect_arr)).to eq([
      [1, 4],
      [2, 5],
      [3, 6]
      ])
  end

  it 'should transpose a different rectangular matrix' do
    expect(transpose(tall_rect_arr)).to eq([
      [1, 3, 5],
      [2, 4, 6]
      ])
  end

  it 'should not modify the original' do
    transpose(small_arr)
    expect(small_arr).to eq([
      [1, 2],
      [3, 4]
      ])
  end

  it 'should not call the Array#transpose method' do
    expect(arr).not_to receive(:transpose)
    transpose(arr)
  end
end

describe '#sum_rec' do
  # write a method called 'sum_rec' that
  # recursively calculates the sum of an array of values

  it "returns 0 if no values are given" do
    expect(sum_rec([])).to eq(0)
  end

  it "returns the first value if 1 value is given" do
    expect(sum_rec([1])).to eq(1)
  end

  it "calls itself recursively" do
    expect(self).to receive(:sum_rec).at_least(:twice).and_call_original
    sum_rec([1, 2, 3, 4])
  end

  it "sums multiple numbers" do
    expect(sum_rec([1, 2, 3, 4])).to eq(10)
  end

  it "sums multiple numbers II" do
    expect(sum_rec([-10, 10, 5, 4])).to eq(9)
  end
end

# This method returns true if the sentence passed as an argument
# can be created by rearranging the receiver.
describe "shuffled_sentence_detector" do
  it "can detect a shuffled sentence" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate the cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(true)
  end

  it "doesn't return false positives" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate a cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "anagrams don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "tcatr hatha eteet"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "partial matches don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end
end

# This method returns the largest factor of
# the number that is prime.
describe 'largest_prime_factor' do
  it 'returns 2 for 2' do
    expect(largest_prime_factor(2)).to eq(2)
  end

  it 'returns 5 for 10' do
    expect(largest_prime_factor(10)).to eq(5)
  end
  it 'can detect larger factors' do
    expect(largest_prime_factor(152)).to eq(19)
  end
  it 'can detect even larger factors' do
    expect(largest_prime_factor(2098)).to eq(1049)
  end

  it "returns original number if it is prime" do
    expect(largest_prime_factor(13)).to eq(13)
  end

  it 'returns nil for zero and one' do
    expect(largest_prime_factor(0)).to be_nil
    expect(largest_prime_factor(1)).to be_nil
  end
end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each or Array#map! method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    expect(original_array).not_to receive(:map!)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to be(original_array)
  end
end

describe 'Array#my_select' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test element"].my_select(&block)
    end.to yield_control
  end

  it 'yields each element to the block' do
    test_array = ["el1", "el2", "el3"]
    expect do |block|
      test_array.my_select(&block)
    end.to yield_successive_args("el1", "el2", "el3")
  end

  it 'returns an array of filtered down items' do
    test_array = [1, 2, 3, 4, 5]
    expect(test_array.my_select(&:odd?)).to eq([1, 3, 5])
    expect(test_array.my_select { |el| el < 3 }).to eq([1, 2])
  end

  it 'does NOT call the built in Array#select' do
    test_array = ["el1", "el2", "el3"]
    expect(test_array).not_to receive(:select)
    test_array.my_select {}
  end
end

