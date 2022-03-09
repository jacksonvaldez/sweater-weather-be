class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.where(api_key: params['api_key']).first

    if user && params['origin'] && params['destination'] && MapQuestFacade.get_travel_time([params['origin'], params['destination']])
      road_trip_data = Hash.new

      travel_time = MapQuestFacade.get_travel_time([params['origin'], params['destination']]) # returns integer in seconds
      destination_coordinates = MapQuestFacade.get_coordinates(params['destination'])
      forecast_at_eta = OpenWeatherFacade.get_forecast_by_time(destination_coordinates, travel_time)

      road_trip_data[:origin] = params['origin']
      road_trip_data[:destination] = params['destination']
      road_trip_data[:travel_time] = travel_time
      road_trip_data[:temperature_at_eta] = forecast_at_eta.temperature
      road_trip_data[:conditions_at_eta] = forecast_at_eta.conditions

      road_trip = RoadTrip.new(road_trip_data)

      render json: RoadTripSerializer.show(road_trip)
    elsif user
      render json: ErrorSerializer.return_errors(["invalid or missing params"]), status: 404
    else
      render json: ErrorSerializer.return_errors(["api_key is invalid or missing"]), status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

end
