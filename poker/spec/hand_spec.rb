require 'hand'

describe Hand do
  describe PokerHands do
    let(:d_14) { double(suit: :diamond, rank: 14) }
    let(:h_14) { double(suit: :heart, rank: 14) }
    let(:s_14) { double(suit: :spade, rank: 14) }
    let(:s_9) { double(suit: :spade, rank: 9) }
    let(:c_9) { double(suit: :club, rank: 9) }
    let(:c_8) { double(suit: :club, rank: 8) }
    let(:c_7) { double(suit: :club, rank: 7) }
    let(:c_6) { double(suit: :club, rank: 6) }
    let(:c_5) { double(suit: :club, rank: 5) }

    describe '#one_pair?' do
      let(:pair_hand) { Hand.new([s_14, s_9, h_14, c_9, d_14]) }
      let(:no_pair_hand) { Hand.new([s_14, s_9, c_5, c_6, c_7]) }
      it 'returns true if hand has pair' do
        expect(pair_hand.one_pair?).to be_truthy
      end

      it 'returns false if hand has no pair' do
        expect(no_pair_hand.one_pair?).to be_falsy
      end
    end

    describe '#three_of_kind?' do
      let(:three_hand) { Hand.new([s_14, s_9, h_14, c_9, d_14]) }
      let(:no_three_hand) { Hand.new([s_14, s_9, c_5, c_6, c_7]) }
      it 'returns true if hand has three of a kind' do
        expect(three_hand.three_of_kind?).to be_truthy
      end

      it 'returns false if hand has no three of a kind' do
        expect(no_three_hand.three_of_kind?).to be_falsy
      end
    end

    describe '#flush?' do
      let(:flush_hand) { Hand.new([c_5, c_6, c_7, c_8, c_9]) }
      let(:no_flush_hand) { Hand.new([s_14, s_9, h_14, c_9, d_14]) }
      it 'returns true if hand has flush' do
        expect(flush_hand.flush?).to be_truthy
      end

      it 'returns false if hand has no flush' do
        expect(no_flush_hand.flush?).to be_falsy
      end
    end

    describe '#straight?' do
      let(:straight_hand) { Hand.new([c_5, c_6, c_7, c_8, c_9]) }
      let(:no_straight_hand) { Hand.new([s_14, s_9, h_14, c_9, d_14]) }
      let(:unsorted_straight_hand) { Hand.new([c_9, c_6, c_7, c_5, c_8]) }

      it 'returns true if hand has straight' do
        expect(straight_hand.straight?).to be_truthy
      end

      it 'returns false if hand has no straight' do
        expect(no_straight_hand.straight?).to be_falsy
      end

      it 'returns true even if straight hand is unsorted' do
        expect(unsorted_straight_hand.straight?).to be_truthy
      end
    end

    describe '#straight_flush?' do
      let(:straight_flush_hand) { Hand.new([c_5, c_6, c_7, c_8, c_9]) }
      let(:false_hand) { Hand.new([s_14, s_9, h_14, c_9, d_14]) }

      it 'returns true if hand has straight' do
        expect(straight_flush_hand.straight_flush?).to be_truthy
      end

      it 'returns false if hand has no straight' do
        expect(false_hand.straight_flush?).to be_falsy
      end
    end

  end

end
