require 'oyster'

describe Oyster do
  subject(:oystercard) { described_class.new }
  let(:station){ double :station }
  let(:journey){ double :journey }

  describe '#initialize' do
    it 'starts with a balance of 0' do
      expect(oystercard.balance).to eq 0
    end

    it 'has an empty list of journeys' do
      expect(oystercard.journey_history).to be_empty
    end
  end

    describe '#top up' do
      it 'can top up the balance' do
      expect(oystercard.top_up(5)).to eq 5
      expect(oystercard.top_up(10)).to eq 15
    end

      context 'max balance exceeded' do
        it 'raises error' do
          maximum_balance = Oyster::MAX_BALANCE
          oystercard.top_up(maximum_balance)
          expect { expect(oystercard.top_up(1)) }.to raise_error("Balance will exceed £#{maximum_balance} maximum")
        end
      end
    end

    describe '#touch_in' do
      it 'starts a new journey if enough money' do
      oystercard.touch_in unless oystercard.balance < Oyster::MIN_BALANCE
      expect(oystercard).to be_in_journey unless oystercard.balance < Oyster::MIN_BALANCE
    end

      context 'not enough money to travel' do
        it 'raises error' do
          oystercard.balance
          expect { oystercard.touch_in(station) }.to raise_error("Not enough money")
        end
      end
    end

    describe '#touch_out' do
      it 'ends the journey and deducts fare' do
        oystercard.top_up(5)
        oystercard.touch_in(station)
        oystercard.touch_out(station) if oystercard.balance > Oyster::MIN_BALANCE
        #expect(oystercard).not_to be_in_journey if oystercard.balance > Oyster::MIN_BALANCE
        expect{ oystercard.touch_out(station) }.to change{oystercard.balance}.by(-Oyster::MIN_BALANCE)
      end
    end

    describe '#add_journey' do
      it 'stores a journey' do
        oystercard.top_up(10)
        oystercard.touch_in(station)
        oystercard.touch_out(station)
        expect{ oystercard.add_journey }.to change {oystercard.journey_history.count}.by(1)
      end
    end
  end
