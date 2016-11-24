require 'player'

describe Player do

  let(:d_14) { double(suit: :diamond, rank: 14) }
  let(:h_14) { double(suit: :heart, rank: 14) }
  let(:s_14) { double(suit: :spade, rank: 14) }
  let(:s_9) { double(suit: :spade, rank: 9) }
  let(:c_9) { double(suit: :club, rank: 9) }
  let(:c_8) { double(suit: :club, rank: 8) }
  let(:c_7) { double(suit: :club, rank: 7) }
  let(:c_6) { double(suit: :club, rank: 6) }
  let(:c_5) { double(suit: :club, rank: 5) }

  describe '#initialize' do
    let(:player_null) { Player.new }

    it 'initializes default player with no hand passed' do
      expect(player_null.hand.hand).to eq([])
    end

    it 'initializes default player with no pot passed' do
      expect(player_null.pot).to eq(100)
    end
  end

  describe '#trade_cards' do
    let(:hand) { double(hand: [c_9, c_8, c_7, c_6, c_5]) }
    let(:deck) { double(deck: [s_9, s_14, h_14, d_14]) }
    let(:player) { Player.new(hand) }

    it 'only adds to hand the number of cards discarded' do

    end

    it 'removes the correct cards'

    it 'raises error when trading more than three cards'
  end

end
