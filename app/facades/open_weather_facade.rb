class OpenWeatherFacade

  def self.get_forecast(coordinates)
    data = OpenWeatherService.get_forecast(coordinates)
    data[:daily][0][:weather][0][:description]
  end

end
