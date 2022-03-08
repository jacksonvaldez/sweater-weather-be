class Api::V1::Forecast::SearchController < ApplicationController

  def index
    if params['location']
      coordinates = MapQuestFacade.get_coordinates(params['location'])
      current_weather = OpenWeatherFacade.get_current_weather(coordinates)
      daily_forecasts = OpenWeatherFacade.get_daily_forecasts(coordinates).first(5)
      hourly_forecasts = OpenWeatherFacade.get_hourly_forecasts(coordinates).first(8)
      # binding.pry
      render json: ForecastSerializer.all_forecasts(current_weather, daily_forecasts, hourly_forecasts)
    else
      render json: ErrorSerializer.return_error(["location param is missing"]), status: 404
    end
  end

end
