require 'rails_helper'

RSpec.describe 'Get forecast by city' do

  it 'gets forecast for a city', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data]).to be_a(Hash)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:type]).to be_a(String)
    expect(forecast[:data][:attributes]).to be_a(Hash)
    expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(forecast[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:data][:attributes][:hourly_weather]).to be_a(Array)
  end

  it 'returns error if location not provided', :vcr do
    get '/api/v1/forecast'

    expect(response).to_not be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:errors]).to be_a(Array)
  end

end
