# Responsible for starting a journey, finishing a journey,
# calculating the fare of a journey, and returning whether or not the journey is complete

require_relative 'oyster'
require_relative 'station'

class Journey

  attr_reader :entry_station, :exit_station, :journey_fare

  PENALTY_FARE = 6

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def journey_complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

  def fare
    journey_complete? ? (@journey_fare = 1) : penalty
  end

  def penalty
    @journey_fare = PENALTY_FARE unless journey_complete?
  end

end
