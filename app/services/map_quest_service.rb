class MapQuestService

  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: { key: ENV['mapquest_api_key'] }
    )
  end

  def self.get_coordinates(location)
    response = conn.get('geocoding/v1/address') do |req|
      req.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_optimized_route(locations)
    json = { locations: locations }.to_json

    response = conn.get('directions/v2/optimizedroute') do |req|
      req.params['json'] = json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
