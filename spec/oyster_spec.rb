require 'oyster'

describe Oyster do
  context '#initialize' do
    it { expect(subject).to have_attributes(:balance => 0) }
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

  context '#deduct' do
    it 'deducts money' do
      oyster = Oyster.new
      oyster.top_up(10)
      expect { oyster.deduct 5 }.to change { oyster.balance }.by -5
    end
  end
end
