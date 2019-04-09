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

  # Can delete this test as we are using our touch_out method to deduct from the balance, so we are testing
  # our 'deduct' method implicitly whilst testing touch_out. Our deduct method is not needed by any other
  # object, so we can move it to private. This helps to keep functionality encapsulated. Now private, you
  # don't need a test for it. See step 10 of Walkthrough.

  # context '#deduct' do
  #   it 'deducts money' do
  #     oyster = Oyster.new
  #     oyster.top_up(10)
  #     expect { oyster.deduct 5 }.to change { oyster.balance }.by -5
  #   end
  # end

  context 'travelling' do
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
      oyster.touch_out if oyster.balance > Oyster::MIN_BALANCE
      expect(oyster).not_to be_in_journey if oyster.balance > Oyster::MIN_BALANCE
      expect{ oyster.touch_out }.to change{oyster.balance}.by(-Oyster::MIN_BALANCE)
    end
  end

  context 'not enough money to travel' do
    oyster = Oyster.new
    it 'raises error' do
      oyster.balance
      expect { subject.touch_in }.to raise_error("Not enough money")
    end
  end
end
