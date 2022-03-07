require 'rails_helper'

RSpec.describe OpenWeatherService do

  describe 'self.get_forecast' do
    it 'returns a hash', :vcr do
      response = OpenWeatherService.get_forecast({ lat: 20, lng: 20 })
      expect(response).to be_a(Hash)
    end
  end

end
