class Oyster

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  JOURNEY_HISTORY = []

  def initialize
    @balance = 0
    @journey = {}
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
    #@entry_station = station
    @journey["entry_station".to_sym] = station.to_s
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    "Touched out"
    @journey["exit_station".to_sym] = station.to_s
    @entry_station = nil
    #@exit_station = station
    JOURNEY_HISTORY << @journey
  end

  private
  def deduct(money)
    @balance -= money
  end
end
