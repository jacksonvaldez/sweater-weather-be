require 'date'

class DailyForecast

  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = datetime_convert(data[:dt])
    @sunrise = datetime_convert(data[:sunrise])
    @sunset = datetime_convert(data[:sunset])
    @max_temp = temperature_convert(data[:temp][:max])
    @min_temp = temperature_convert(data[:temp][:min])
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end

  def datetime_convert(time) # Convert time from Unix, UTC to human readable UTC
    dt = DateTime.strptime("#{time}",'%s')
    dt.strftime("%d %B %Y, %l:%M %p, %z")
  end

  def temperature_convert(temperature) # Convert temperature from Kelvin to Farenheit
    farenheit = 1.8 * (temperature - 273.15) + 32
  end

end
