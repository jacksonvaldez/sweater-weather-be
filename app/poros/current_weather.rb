require 'date'

class CurrentWeather

  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime = datetime_convert(data[:dt])
    @sunrise = datetime_convert(data[:sunrise])
    @sunset = datetime_convert(data[:sunset])
    @temperature = temperature_convert(data[:temp])
    @feels_like = temperature_convert(data[:feels_like])
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
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
