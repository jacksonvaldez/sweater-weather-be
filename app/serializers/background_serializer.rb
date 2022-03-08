class BackgroundSerializer

  def self.show(location, url)
    {
      data: {
        type: 'image',
        id: nil,
        attributes: {
          location: location,
          url: url
        }
      }
    }
  end

end
