require_relative '../karate_chop'

RSpec.describe KarateChop do
  describe '#chop' do
    it 'should return -1 for an empty array' do
      expect(KarateChop.chop(1, [])).to eq(-1)
    end

    it 'should return 0 when number found in array of size 1' do
      expect(KarateChop.chop(1, [1])).to eq(0)
    end

    it 'should return -1 when number not found in array' do
      expect(KarateChop.chop(2, [1])).to eq(-1)
      expect(KarateChop.chop(0, [1, 3, 5])).to eq(-1)
      expect(KarateChop.chop(2, [1, 3, 5])).to eq(-1)
      expect(KarateChop.chop(4, [1, 3, 5])).to eq(-1)
      expect(KarateChop.chop(6, [1, 3, 5])).to eq(-1)
      expect(KarateChop.chop(0, [1, 3, 5, 7])).to eq(-1)
      expect(KarateChop.chop(2, [1, 3, 5, 7])).to eq(-1)
      expect(KarateChop.chop(4, [1, 3, 5, 7])).to eq(-1)
      expect(KarateChop.chop(6, [1, 3, 5, 7])).to eq(-1)
      expect(KarateChop.chop(8, [1, 3, 5, 7])).to eq(-1)
    end

    it 'should return index of searched number for an array with n elements' do
      expect(KarateChop.chop(1, [1, 3, 5])).to eq(0)
      expect(KarateChop.chop(3, [1, 3, 5])).to eq(1)
      expect(KarateChop.chop(5, [1, 3, 5])).to eq(2)

      expect(KarateChop.chop(1, [1, 3, 5, 7])).to eq(0)
      expect(KarateChop.chop(3, [1, 3, 5, 7])).to eq(1)
      expect(KarateChop.chop(5, [1, 3, 5, 7])).to eq(2)
      expect(KarateChop.chop(7, [1, 3, 5, 7])).to eq(3)
    end

    it 'should return index of searched number for a huge array' do
      huge_array = Array(1..100_000)
      expect(KarateChop.chop(1, huge_array)).to eq(0)
      expect(KarateChop.chop(100_000, huge_array)).to eq(99_999)
      expect(KarateChop.chop(999, huge_array)).to eq(998)
    end

  end
end
