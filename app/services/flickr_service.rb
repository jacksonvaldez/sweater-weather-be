class FlickrService

  def self.conn
    Faraday.new(
      url: 'https://www.flickr.com',
      params: {
        api_key: ENV['flickr_api_key'],
        format: 'json',
        nojsoncallback: 1
      }
    )
  end

  def self.get_images(query)
    response = conn.get('services/rest') do |req|
      req.params['method'] = 'flickr.photos.search'
      req.params['text'] = query
      req.params['geo_context'] = 2 # Only Include Photos Taken Outside
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
