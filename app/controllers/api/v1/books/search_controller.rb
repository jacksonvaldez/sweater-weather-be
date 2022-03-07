class Api::V1::Books::SearchController < ApplicationController

  def index # GET /api/v1/book-search?location=<city>,<state>&quantity=<quantity>
    coordinates = MapQuestFacade.get_coordinates(params['location'])
    forecast = OpenWeatherFacade.get_forecast(coordinates)

    books = BookSearchFacade.search_books(params['location'])
    quantity = params['quantity'].to_i

    render json: BookSerializer.index(params['location'], forecast, books[0].first(quantity), books[1])
  end

end
