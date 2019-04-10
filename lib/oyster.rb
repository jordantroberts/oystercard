class Oyster

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey
  attr_reader :journey_record

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_record
    @journey = []
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

  def touch_out(station)
    deduct(MIN_BALANCE)
    "Touched out"
    @exit_station = station
    #@journey_record << [@entry_station, @exit_station]
    @entry_station = nil
  end

  private
  def deduct(money)
    @balance -= money
  end
end
