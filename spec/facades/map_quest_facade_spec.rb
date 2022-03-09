require 'rails_helper'

RSpec.describe MapQuestFacade do

  describe 'self.get_coordinates' do
    it 'returns the coordinates for a specific location', :vcr do
      coordinates = MapQuestFacade.get_coordinates('denver, co')

      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lng]).to be_a(Float)
    end
  end

  describe 'self.get_travel_time' do
    it 'returns travel time between locations', :vcr do
      travel_time = MapQuestFacade.get_travel_time(['denver,co', 'pueblo,co'])

      expect(travel_time).to be_a(Integer)
    end

    it 'returns nil if locations are invalid', :vcr do
      travel_time = MapQuestFacade.get_travel_time(['Earth', 'Mars'])

      expect(travel_time).to eq(nil)
    end
  end

end
