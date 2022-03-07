class MapQuestFacade

  def self.get_coordinates(location)
    data = MapQuestService.get_coordinates(location)

    data[:results][0][:locations][0][:latLng]    
  end

end
