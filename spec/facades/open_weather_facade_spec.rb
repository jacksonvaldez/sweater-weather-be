require 'rails_helper'

RSpec.describe OpenWeatherFacade do

  describe 'self.get_forecast' do
    it 'returns a forecast', :vcr do
      expect(OpenWeatherFacade.get_forecast( {lat: 20, lng: 20} )).to be_a(String)
    end
  end

  describe 'self.get_current_weather' do
    it 'returns a current weather object', :vcr do
      expect(OpenWeatherFacade.get_current_weather( {lat: 20, lng: 20} )).to be_a(CurrentWeather)
    end
  end

  describe 'self.get_daily_forecasts' do
    it 'returns an array of daily forecast objects', :vcr do
      expect(OpenWeatherFacade.get_daily_forecasts( {lat: 20, lng: 20} )).to be_a(Array)
      expect(OpenWeatherFacade.get_daily_forecasts( {lat: 20, lng: 20} ).first).to be_a(DailyForecast)
    end
  end

  describe 'self.get_hourly_forecasts' do
    it 'returns an array of hourly forecast objects', :vcr do
      expect(OpenWeatherFacade.get_hourly_forecasts( {lat: 20, lng: 20} )).to be_a(Array)
      expect(OpenWeatherFacade.get_hourly_forecasts( {lat: 20, lng: 20} ).first).to be_a(HourlyForecast)
    end
  end

end
