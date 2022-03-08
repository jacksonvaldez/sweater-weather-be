class FlickrFacade

  def self.get_image_url(query)
    json = FlickrService.get_images(query)
    image_data = json[:photos][:photo].first

    "https://live.staticflickr.com/#{image_data[:server]}/#{image_data[:id]}_#{image_data[:secret]}.jpg"
  end

end
