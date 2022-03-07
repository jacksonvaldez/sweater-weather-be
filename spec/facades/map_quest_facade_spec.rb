require 'rails_helper'

RSpec.describe MapQuestFacade do

  describe 'self.get_coordinates' do
    it 'returns the coordinates for a specific location', :vcr do
      coordinates = MapQuestFacade.get_coordinates('denver, co')

      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lng]).to be_a(Float)
    end
  end

end
