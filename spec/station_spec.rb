require 'station'

describe Station do
  let(:name) { double :name }
  let(:zone) { double :zone }

  describe '#initialize' do
    station = Station.new(:name, :zone)
    it 'knows its name' do
      expect(station.name).to eq :name
    end

    it 'knows its zone' do
      expect(station.zone).to eq :zone
    end
  end
end 
