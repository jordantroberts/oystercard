require_relative 'oyster'
require_relative 'journey'

class Station

attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
