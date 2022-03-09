class RoadTrip

  attr_reader :origin,
              :destination,
              :travel_time,
              :temperature_at_eta,
              :conditions_at_eta

  def initialize(data)
    @origin = data[:origin]
    @destination = data[:destination]
    @travel_time = convert_travel_time(data[:travel_time])
    @temperature_at_eta = data[:temperature_at_eta] # in farenheit
    @conditions_at_eta = data[:conditions_at_eta]
  end

  def convert_travel_time(seconds)
    hours = (seconds / 3600).to_i
    minutes = ((seconds % 3600) / 60).to_i
    "#{hours} hours, #{minutes} minutes"
  end

end
