class Oyster

  attr_reader :balance
  attr_reader :entry_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise("Balance will exceed £#{MAX_BALANCE} maximum") if (@balance + money) > MAX_BALANCE

    @balance += money
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise "Not enough money" if @balance < MIN_BALANCE
    "Touched in"
    @entry_station = station
  end

  def touch_out
    deduct(MIN_BALANCE)
    "Touched out"
    @entry_station = nil
  end

  private
  def deduct(money)
    @balance -= money
  end
end
