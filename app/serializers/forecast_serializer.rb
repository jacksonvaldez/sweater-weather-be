class ForecastSerializer

  def self.all_forecasts(current_weather, daily_forecasts, hourly_forecasts)
    binding.pry
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: {
            datetime: current_weather.datetime,
            sunrise: current_weather.sunrise,
            sunset: current_weather.sunset,
            temperature: current_weather.temperature,
            feels_like: current_weather.feels_like,
            humidity: current_weather.humidity,
            uvi: current_weather.uvi,
            visibility: current_weather.visibility,
            conditions: current_weather.conditions,
            icon: current_weather.icon
          },
          daily_weather: daily_forecasts.map do |daily_forecast|
            {
              date: daily_forecast.date,
              sunrise: daily_forecast.sunrise,
              sunset: daily_forecast.sunset,
              max_temp: daily_forecast.max_temp,
              min_temp: daily_forecast.min_temp,
              conditions: daily_forecast.conditions,
              icon: daily_forecast.icon
            }
          end,
          hourly_weather: hourly_forecasts.map do |hourly_forecast|
            {
              time: hourly_forecast.time,
              temperature: hourly_forecast.temperature,
              conditions: hourly_forecast.conditions,
              icon: hourly_forecast.icon
            }
          end
        }
      }
    }
  end

end
