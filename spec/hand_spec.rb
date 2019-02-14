require_relative '../lib/hand.rb'
require_relative '../lib/card.rb'
RSpec.describe Hand do
 describe 'poker hand identification methods' do

      it 'identifies a Pair' do
        expect(Hand.new('8S 2H KD 3C 8H'.split(" ")).pair?).to be_truthy
        expect(Hand.new('8S 2H KD 3C 4S'.split(" ")).pair?).to be_falsey
      end

      it 'identifies Two Pairs' do
        expect(Hand.new('QD JC QS JH 2D'.split(" ")).two_pairs?).to be_truthy
        expect(Hand.new('QD JC TS JH 2D'.split(" ")).two_pairs?).to be_falsey
      end

      it 'identifies a Three of a Kind' do
        expect(Hand.new('AS KH QD KC KS'.split(" ")).three_of_a_kind?).to be_truthy
        expect(Hand.new('AS KH QD KC TS'.split(" ")).three_of_a_kind?).to be_falsey
      end

      it 'identifies a Straight' do
        expect(Hand.new('AH KD TD JD QD'.split(" ")).straight?).to be_truthy
        expect(Hand.new('2D 3D 4D 5D 7D'.split(" ")).straight?).to be_falsey
      end

      it 'identifies a Flush' do
        expect(Hand.new('AS KS QS JS 6S'.split(" ")).flush?).to be_truthy
        expect(Hand.new('2C AC 3C JC 4D'.split(" ")).flush?).to be_falsey
      end

      it 'identifies a Full' do
        expect(Hand.new('AH 9C 9D AD 9H'.split(" ")).full?).to be_truthy
        expect(Hand.new('AH 2C 9D AD 9H'.split(" ")).full?).to be_falsey
      end

      it 'identifies a Four of a Kind' do
        expect(Hand.new('TS TH 2C TD TC'.split(" ")).four_of_a_kind?).to be_truthy
        expect(Hand.new('TS TH 2C TD QC'.split(" ")).four_of_a_kind?).to be_falsey
      end

      it 'identifies a Straight Flush' do
        expect(Hand.new('JS TS QS AS KS'.split(" ")).straight_flush?).to be_truthy
        expect(Hand.new('3C 2C 4D 6C 5C'.split(" ")).straight_flush?).to be_falsey
      end

      it 'identifies a Royal Flush' do
        expect(Hand.new('AS KS QS JS TS'.split(" ")).royal_flush?).to be_truthy
        expect(Hand.new('AS KS QS JS 9S'.split(" ")).royal_flush?).to be_falsey
      end
    end
  end

