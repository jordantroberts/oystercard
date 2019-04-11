require_relative 'station'
require_relative 'journey'

class Oyster

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey_history
  attr_reader :journey_class
  attr_reader :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @journey_class = journey_class
  end

  def top_up(money)
    raise("Balance will exceed £#{MAX_BALANCE} maximum") if (@balance + money) > MAX_BALANCE

    @balance += money
  end

  def in_journey?
    !!entry_station # !! converts the value to a boolean
  end

  def touch_in(station)
    raise "Not enough money" if @balance < MIN_BALANCE
    @journey = Journey.new
    @journey.start_journey(station)
    @entry_station = station
  end

  def touch_out(station)
    @journey.end_journey(station)
    @exit_station = station
    deduct(@journey.fare)
    add_journey
  end

  def add_journey
    journey = { :entry => entry_station, :exit => exit_station }
    @journey_history << journey
  end

  private
  def deduct(money)
    @balance -= money
  end
end
