require 'rails_helper'

RSpec.describe 'Search Images' do

  it 'returns an image url based on location', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image[:data]).to be_a(Hash)
    expect(image[:data][:type]).to eq('image')
    expect(image[:data][:id]).to eq(nil)
    expect(image[:data][:attributes]).to be_a(Hash)
    expect(image[:data][:attributes][:location]).to be_a(String)
    expect(image[:data][:attributes][:url]).to be_a(String)
  end

end
