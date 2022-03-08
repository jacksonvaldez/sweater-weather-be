require 'rails_helper'

RSpec.describe ForecastSerializer do

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

    daily_forecast_data = {
      dt: 12345,
      sunrise: 123456,
      sunset: 1234567,
      temp: {
        max: 305,
        min: 295,
      },
      weather: [{description: 'description-1', icon: 'icon-1'}]
    }
    daily_forecast = DailyForecast.new(daily_forecast_data)

    hourly_forecast_data = {
      dt: 12345,
      temp: 300,
      weather: [{description: 'description-2', icon: 'icon-2'}]
    }
    hourly_forecast = HourlyForecast.new(hourly_forecast_data)

    @daily_forecasts = [daily_forecast, daily_forecast]
    @hourly_forecasts = [hourly_forecast, hourly_forecast]
  end

  it 'returns expected hash' do
    
    expected = {:data=>
  {:id=>nil,
   :type=>"forecast",
   :attributes=>
    {:current_weather=>
      {:datetime=>"01 January 1970,  3:25 AM, +0000",
       :sunrise=>"02 January 1970, 10:17 AM, +0000",
       :sunset=>"15 January 1970,  6:56 AM, +0000",
       :temperature=>80.33000000000004,
       :feels_like=>85.73000000000005,
       :humidity=>50,
       :uvi=>2,
       :visibility=>45,
       :conditions=>"description",
       :icon=>"icon"},
     :daily_weather=>
      [{:date=>"01 January 1970,  3:25 AM, +0000",
        :sunrise=>"02 January 1970, 10:17 AM, +0000",
        :sunset=>"15 January 1970,  6:56 AM, +0000",
        :max_temp=>89.33000000000004,
        :min_temp=>71.33000000000004,
        :conditions=>"description-1",
        :icon=>"icon-1"},
       {:date=>"01 January 1970,  3:25 AM, +0000",
        :sunrise=>"02 January 1970, 10:17 AM, +0000",
        :sunset=>"15 January 1970,  6:56 AM, +0000",
        :max_temp=>89.33000000000004,
        :min_temp=>71.33000000000004,
        :conditions=>"description-1",
        :icon=>"icon-1"}],
     :hourly_weather=>
      [{:time=>" 3:25 AM, +0000", :temperature=>80.33000000000004, :conditions=>"description-2", :icon=>"icon-2"},
       {:time=>" 3:25 AM, +0000", :temperature=>80.33000000000004, :conditions=>"description-2", :icon=>"icon-2"}]}}}

    expect(ForecastSerializer.all_forecasts(@current_weather, @daily_forecasts, @hourly_forecasts)).to eq(expected)
  end

end
