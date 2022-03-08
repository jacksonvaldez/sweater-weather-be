require 'date'

class HourlyForecast

  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = datetime_convert(data[:dt])
    @temperature = temperature_convert(data[:temp])
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end

  def datetime_convert(time) # Convert time from Unix, UTC to human readable UTC
    dt = DateTime.strptime("#{time}",'%s')
    dt.strftime("%l:%M %p, %z")
  end

  def temperature_convert(temperature) # Convert temperature from Kelvin to Farenheit
    farenheit = 1.8 * (temperature - 273.15) + 32
  end

end
