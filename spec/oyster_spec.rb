require 'oyster'

describe Oyster do
  subject(:oystercard) { described_class.new }
  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  context '#top up' do
    oyster = Oyster.new
    it { expect(oyster.top_up(5)).to eq 5 }
    it { expect(oyster.top_up(10)).to eq 15 }
  end
  context 'max balance exceeded' do
    it 'raises error' do
      maximum_balance = Oyster::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { expect(subject.top_up(1)) }.to raise_error("Balance will exceed £#{maximum_balance} maximum")
    end
  end

  context 'travelling' do
    let(:station) { double :station }
    oyster = Oyster.new
    it '#in_journey' do
      expect(oyster).not_to be_in_journey
    end

    it '#touch_in' do
      oyster.touch_in unless oyster.balance < Oyster::MIN_BALANCE
      expect(oyster).to be_in_journey unless oyster.balance < Oyster::MIN_BALANCE
    end

    let(:station) { double :station }
    it 'remembers station' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it '#touch_out' do
      oyster.top_up(5)
      oyster.touch_out if oyster.balance > Oyster::MIN_BALANCE
      expect(oyster).not_to be_in_journey if oyster.balance > Oyster::MIN_BALANCE
      expect{ oyster.touch_out }.to change{oyster.balance}.by(-Oyster::MIN_BALANCE)
    end
  end

  let(:station) { double :station }
  context 'not enough money to travel' do
    oyster = Oyster.new
    it 'raises error' do
      oyster.balance
      expect { subject.touch_in(station) }.to raise_error("Not enough money")
    end
  end
end
