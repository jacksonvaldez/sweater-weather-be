require 'rails_helper'

RSpec.describe RoadTrip do

  before(:each) do
    road_trip_data = {
      origin: 'origin',
      destination: 'destination',
      travel_time: 12345,
      temperature_at_eta: 50.4,
      conditions_at_eta: 'cloudy with a chance of meatballes'
    }

    @road_trip = RoadTrip.new(road_trip_data)
  end

  it 'exists' do
    expect(@road_trip).to be_a(RoadTrip)
  end

  it 'attributes' do
    expect(@road_trip.origin).to eq('origin')
    expect(@road_trip.destination).to eq('destination')
    expect(@road_trip.travel_time).to eq('3 hours, 25 minutes')
    expect(@road_trip.temperature_at_eta).to eq(50.4)
    expect(@road_trip.conditions_at_eta).to eq('cloudy with a chance of meatballes')
  end

  describe '#convert_travel_time' do
    it 'converts seconds to a string of time (x hours, y minutes)' do
      expect(@road_trip.convert_travel_time(55555)).to eq("15 hours, 25 minutes")
    end
  end

end
