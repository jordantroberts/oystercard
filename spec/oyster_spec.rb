require 'oyster'

describe Oyster do
  subject(:oystercard) { described_class.new }
  it 'starts with a balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'has an empty list of journeys' do
    expect(oystercard.journey_history).to be_empty
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
    let(:fake_station) { double :station }
    oyster = Oyster.new
    it '#in_journey' do
      expect(oyster).not_to be_in_journey
    end

    it '#touch_in' do
      oyster.touch_in unless oyster.balance < Oyster::MIN_BALANCE
      expect(oyster).to be_in_journey unless oyster.balance < Oyster::MIN_BALANCE
    end

    it '#touch_out' do
      oyster.top_up(5)
      oyster.touch_out(fake_station) if oyster.balance > Oyster::MIN_BALANCE
      expect(oyster).not_to be_in_journey if oyster.balance > Oyster::MIN_BALANCE
      expect{ oyster.touch_out(fake_station) }.to change{oyster.balance}.by(-Oyster::MIN_BALANCE)
    end

  let(:fake_station) { double :station }
    describe '#add_journey' do
    it 'stores a journey' do
      oyster.top_up(10)
      oyster.touch_in(fake_station)
      oyster.touch_out(fake_station)
      expect{ oyster.add_journey }.to change {oyster.journey_history}.by([])
    end
  end
end

  let(:fake_station) { double :station }
  context 'not enough money to travel' do
    oyster = Oyster.new
    it 'raises error' do
      oyster.balance
      expect { subject.touch_in(fake_station) }.to raise_error("Not enough money")
    end
  end
end
