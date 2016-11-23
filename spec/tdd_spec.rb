require 'tdd'

describe '#my_uniq' do
  let(:arr1) { [6, 2, 2, 6, 3, 2, 6] }
  let(:uniq_arr1) { [6, 2, 3] }
  let(:arr2) { [1, 2, 3] }

  it 'returns an array containing the unique elements' do
    expect(arr1.my_uniq).to eq(uniq_arr1)
  end

  it 'returns the array if already unique' do
    expect(arr2.my_uniq).to eq(arr2)
  end
end

describe '#two_sum' do
  let(:none_arr) { [1, 2, 3] }
  let(:one_pair) { [-1, 0, 4, 1] }
  let(:three_pairs) { [2, 3, 5, -2, -2, -3] }
  let(:two_zeros) { [0, 4, 5, 0] }

  it 'returns nil if no two numbers sum to 0' do
    expect(none_arr.two_sum).to eq([])
  end

  it 'returns one pair' do
    expect(one_pair.two_sum).to eq([[0, 3]])
  end

  it 'returns three pairs dictionary-wise' do
    expect(three_pairs.two_sum).to eq([[0, 3], [0, 4], [1, 5]])
  end

  it 'works with two zeros' do
    expect(two_zeros.two_sum).to eq([[0, 3]])
  end
end

describe '#my_transpose' do
  let(:sq_mat) do
    [[0, 1, 2],
     [3, 4, 5],
     [6, 7, 8]]
  end
  let(:rect_mat) do
    [[0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [9, 10, 11]]
  end
  let(:sq_mat_t) do
    [[0, 3, 6],
     [1, 4, 7],
     [2, 5, 8]]
  end
  let(:rect_mat_t) do
    [[0, 3, 6, 9],
     [1, 4, 7, 10],
     [2, 5, 8, 11]]
  end

  it 'transposes a square matrix' do
    expect(sq_mat.my_transpose).to eq(sq_mat_t)
  end

  it 'transposes a rectangular matrix' do
    expect(rect_mat.my_transpose).to eq(rect_mat_t)
  end
end

describe '#stock_picker' do
  let(:rising) { [1, 2, 3, 4, 5] }
  let(:two_peaks) { [1, -3, 4, -2, 8] }
  let(:crash) { [5, 4, 3, 2, 1] }

  it 'gets correct positions for steady rising stock' do
    expect(stock_picker(rising)).to eq([0, 4])
  end

  it 'gets the bigger of two rises' do
    expect(stock_picker(two_peaks)).to eq([1, 4])
  end

  it 'picks no position when crashing' do
    expect(stock_picker(crash)).to eq([])
  end
end
