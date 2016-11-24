require 'hanoi'

describe Hanoi do
  subject(:towers) { Hanoi.new }

  it "sets up stacks to default values" do
    expect(towers.stacks).to eq([[3, 2, 1], [], []])
  end

  describe "#render" do
    it "prints stacks for each tower" do
      expect(towers.render).to eq("Tower 0:  3 2 1\nTower 1:  \nTower 2:  ")
    end

    it "prints spread out stacks" do
      towers = Hanoi.new([[1], [2], [3]])
      expect(towers.render).to eq("Tower 0:  1\nTower 1:  2\nTower 2:  3")
    end
  end

  describe "#move" do
    it "moves smaller disk onto empty stack" do
      towers.move(0, 1)
      expect(towers.stacks).to eq([[3, 2], [1], []])
    end

    it "moves smaller disk onto bigger disk" do
      towers = Hanoi.new([[3, 1], [2], []])
      towers.move(0, 1)
      expect(towers.stacks).to eq([[3], [2, 1], []])
    end

    it "does not move bigger disk onto smaller disk" do
      towers = Hanoi.new([[3, 2], [1], []])
      towers.move(0, 1)
      expect(towers.stacks).to eq([[3, 2], [1], []])
    end
  end

  describe "#won?" do
    it "default board is not won" do
      expect(towers.won?).to be_falsy
    end

    it "returns true for a winning board" do
      winning = Hanoi.new([[], [3, 2, 1], []])
      expect(winning.won?).to be_truthy
    end

    it "returns false for a game in progress" do
      towers = Hanoi.new([[3, 2], [1], []])
      expect(towers.won?).to be_falsy
    end
    
  end

end
