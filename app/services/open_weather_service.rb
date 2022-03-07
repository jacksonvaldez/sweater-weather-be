class OpenWeatherService

  def self.conn
    Faraday.new(
      url: 'https://api.openweathermap.org',
      params: { appid: ENV['openweathermap_api_key'] }
    )
  end

  def self.get_forecast(coordinates)
    response = conn.get('data/2.5/onecall') do |req|
      req.params['lat'] = coordinates[:lat]
      req.params['lon'] = coordinates[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
