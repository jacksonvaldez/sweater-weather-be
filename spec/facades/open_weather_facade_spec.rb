require 'rails_helper'

RSpec.describe OpenWeatherFacade do

  describe 'self.get_forecast' do
    it 'returns a forecast', :vcr do
      expect(OpenWeatherFacade.get_forecast( {lat: 20, lng: 20} )).to be_a(String)
    end
  end

end
