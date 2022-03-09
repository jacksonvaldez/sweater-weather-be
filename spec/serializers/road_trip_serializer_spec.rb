require 'rails_helper'

RSpec.describe RoadTripSerializer do

  describe 'self.show' do
    it 'returns correct hash for a RoadTrip object' do
      road_trip_data = {
        origin: 'origin',
        destination: 'destination',
        travel_time: 12345,
        temperature_at_eta: 50.4,
        conditions_at_eta: 'cloudy with a chance of meatballes'
      }

      road_trip = RoadTrip.new(road_trip_data)

      expected = {
            data: {
              id: nil,
              type: 'roadtrip',
              attributes: {
                start_city: 'origin',
                end_city: 'destination',
                travel_time: '3 hours, 25 minutes',
                weather_at_eta: {
                  temperature: 50.4,
                  conditions: 'cloudy with a chance of meatballes'
                }
              }
            }
          }

        expect(RoadTripSerializer.show(road_trip)).to eq(expected)
    end
  end
end
