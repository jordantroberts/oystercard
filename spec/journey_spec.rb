require 'journey'

  describe Journey do
    let(:station) { double :station }

    describe '#start of journey' do
      it 'starts the journey at entry station' do
        subject.start_journey(station)
        expect(subject.start_journey(station)).to eq station
      end
    end

    describe '#end of journey' do
      it 'ends the journey at exit station' do
        subject.end_journey(station)
        expect(subject.end_journey(station)).to eq station
      end
    end
  end
