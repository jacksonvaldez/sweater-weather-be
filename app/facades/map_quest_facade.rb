class MapQuestFacade

  def self.get_coordinates(location)
    data = MapQuestService.get_coordinates(location)

    data[:results][0][:locations][0][:latLng]
  end

  def self.get_travel_time(locations)
    data = MapQuestService.get_optimized_route(locations)
    data[:route][:time]
  end

end
