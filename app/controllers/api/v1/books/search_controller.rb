class Api::V1::Books::SearchController < ApplicationController

  def index
    coordinates = MapQuestFacade.get_coordinates(params['location'])
    forecast = OpenWeatherFacade.get_forecast(coordinates)
    
    books = BookSearchFacade.search_books(params['location'])

    render json: BookSerializer.index(params['location'], forecast, books[0], books[1])
  end

end
