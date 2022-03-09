require 'rails_helper'

RSpec.describe 'Create A Road Trip' do

  before(:each) do
    @api_key = SecureRandom.hex
    @user = User.new(email: "something@website.com", password: 'password123', password_confirmation: 'password123')
    @user.api_key = @api_key
    @user.save!
  end

  it 'successfully creates a road trip', :vcr do
    post "/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=#{@api_key}"

    expect(response).to be_successful

    road_trip = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    expect(road_trip.keys).to eq([:data])
    expect(road_trip[:data].keys).to eq([:id, :type, :attributes])
    expect(road_trip[:data][:id]).to eq(nil)
    expect(road_trip[:data][:type]).to eq('roadtrip')
    expect(road_trip[:data][:attributes]).to be_a(Hash)
    expect(road_trip[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
    expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
    expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
    expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
    expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(road_trip[:data][:attributes][:weather_at_eta].keys).to eq([:temperature, :conditions])
    expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

  it 'returns error if api key is missing', :vcr do
    post "/api/v1/road_trip?origin=denver,co&destination=pueblo,co"

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip.keys).to eq([:errors])
    expect(road_trip[:errors]).to be_a(Array)
  end

  it 'returns error if api key is incorrect', :vcr do
    post "/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=incorrect_api_key"

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip.keys).to eq([:errors])
    expect(road_trip[:errors]).to be_a(Array)
  end

  it 'returns error if origin or destination param is missing', :vcr do
    post "/api/v1/road_trip?destination=pueblo,co&api_key=#{@api_key}"

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip.keys).to eq([:errors])
    expect(road_trip[:errors]).to be_a(Array)
  end

end
