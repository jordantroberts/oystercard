# Responsible for starting a journey, finishing a journey,
# calculating the fare of a journey, and returning whether or not the journey is complete

require_relative 'oyster'
require_relative 'station'

class Journey

  attr_reader :entry_station, :exit_station

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def journey_complete?
  end


end
