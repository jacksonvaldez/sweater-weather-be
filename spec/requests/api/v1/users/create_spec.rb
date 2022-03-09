require 'rails_helper'

RSpec.describe 'Create User' do

  it 'creates a user successfully', :vcr do
    post "/api/v1/users?email=email@email.com&password=password123&password_confirmation=password123"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:data])
    expect(user[:data]).to be_a(Hash)
    expect(user[:data].keys).to eq([:type, :id, :attributes])
    expect(user[:data][:type]).to eq('users')
    expect(user[:data][:id]).to be_a(Integer)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes].keys).to eq([:email, :api_key])
    expect(user[:data][:attributes][:email]).to eq('email@email.com')
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'doesnt create user if email param is missing', :vcr do
    post "/api/v1/users?password=password123&password_confirmation=password123"

    expect(response).to_not be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:errors])
    expect(user[:errors]).to be_a(Array)
  end

  it 'doesnt create user if password and password_confirmation dont match', :vcr do
    post "/api/v1/users?email=email@email.com&password=passwordeeee&password_confirmation=password123"

    expect(response).to_not be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:errors])
    expect(user[:errors]).to be_a(Array)
  end

end
