require 'rails_helper'

RSpec.describe HourlyForecast do

  before(:each) do
    hourly_forecast_data = {
      dt: 12345,
      temp: 300,
      weather: [{description: 'description', icon: 'icon'}]
    }
    @hourly_forecast = HourlyForecast.new(hourly_forecast_data)
  end

  it 'exists' do
    expect(@hourly_forecast).to be_a(HourlyForecast)
  end

  it 'has attributes' do
    expect(@hourly_forecast.time).to eq(" 3:25 AM, +0000")
    expect(@hourly_forecast.temperature.to_i).to eq(80)
    expect(@hourly_forecast.conditions).to eq('description')
    expect(@hourly_forecast.icon).to eq('icon')
  end

end
