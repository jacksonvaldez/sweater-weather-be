require 'rails_helper'

RSpec.describe DailyForecast do

  before(:each) do
    daily_forecast_data = {
      dt: 12345,
      sunrise: 123456,
      sunset: 1234567,
      temp: {
        max: 305,
        min: 295,
      },
      weather: [{description: 'description', icon: 'icon'}]
    }
    @daily_forecast = DailyForecast.new(daily_forecast_data)
  end

  it 'exists' do
    expect(@daily_forecast).to be_a(DailyForecast)
  end

  it 'has attriutes' do
    expect(@daily_forecast.date).to eq("01 January 1970,  3:25 AM, +0000")
    expect(@daily_forecast.sunrise).to eq("02 January 1970, 10:17 AM, +0000")
    expect(@daily_forecast.sunset).to eq("15 January 1970,  6:56 AM, +0000")
    expect(@daily_forecast.max_temp.to_i).to eq(89)
    expect(@daily_forecast.min_temp.to_i).to eq(71)
    expect(@daily_forecast.conditions).to eq('description')
    expect(@daily_forecast.icon).to eq('icon')
  end

end
