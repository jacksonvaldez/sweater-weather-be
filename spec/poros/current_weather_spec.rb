require 'rails_helper'

RSpec.describe CurrentWeather do

  before(:each) do
    current_weather_data = {
      dt: 12345,
      sunrise: 123456,
      sunset: 1234567,
      temp: 300,
      feels_like: 303,
      humidity: 50,
      uvi: 2,
      visibility: 45,
      weather: [{description: 'description', icon: 'icon'}]
    }
    @current_weather = CurrentWeather.new(current_weather_data)
  end

  it 'exists' do
    expect(@current_weather).to be_a(CurrentWeather)
  end

  it 'has attriutes' do
    expect(@current_weather.datetime).to eq("01 January 1970,  3:25 AM, +0000")
    expect(@current_weather.sunrise).to eq("02 January 1970, 10:17 AM, +0000")
    expect(@current_weather.sunset).to eq("15 January 1970,  6:56 AM, +0000")
    expect(@current_weather.temperature.to_i).to eq(80)
    expect(@current_weather.feels_like.to_i).to eq(85)
    expect(@current_weather.humidity).to eq(50)
    expect(@current_weather.uvi).to eq(2)
    expect(@current_weather.visibility).to eq(45)
    expect(@current_weather.conditions).to eq('description')
    expect(@current_weather.icon).to eq('icon')
  end

end
