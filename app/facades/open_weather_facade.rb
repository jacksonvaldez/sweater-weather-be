class OpenWeatherFacade

  def self.get_forecast(coordinates)
    forecast = OpenWeatherService.get_forecast(coordinates)
    forecast[:daily][0][:weather][0][:description]
  end

  def self.get_current_weather(coordinates)
    current_weather_data = OpenWeatherService.get_forecast(coordinates)[:current]
    CurrentWeather.new(current_weather_data)
  end

  def self.get_daily_forecasts(coordinates)
    daily_forecasts = OpenWeatherService.get_forecast(coordinates)[:daily]

    daily_forecasts.map do |daily_forecast_data|
      DailyForecast.new(daily_forecast_data)
    end
  end

  def self.get_hourly_forecasts(coordinates)
    hourly_forecasts = OpenWeatherService.get_forecast(coordinates)[:hourly]

    hourly_forecasts.map do |hourly_forecast_data|
      HourlyForecast.new(hourly_forecast_data)
    end
  end

end
