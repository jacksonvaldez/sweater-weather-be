require 'rails_helper'

RSpec.describe 'Login Endpoint' do

  before(:each) do
    api_key = SecureRandom.hex
    @user = User.new(email: "something@website.com", password: 'password123', password_confirmation: 'password123')
    @user.api_key = api_key
    @user.save!
  end

  it 'can successfully login', :vcr do
    post '/api/v1/sessions?email=something@website.com&password=password123'

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:data])
    expect(user[:data]).to be_a(Hash)
    expect(user[:data].keys).to eq([:type, :id, :attributes])
    expect(user[:data][:type]).to eq('users')
    expect(user[:data][:id]).to be_a(Integer)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes].keys).to eq([:email, :api_key])
    expect(user[:data][:attributes][:email]).to eq('something@website.com')
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'doesnt login if email isnt recorded' do
    post '/api/v1/sessions?email=anotheremail@email.net&password=password123'

    expect(response).to_not be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:errors])
    expect(user[:errors]).to be_a(Array)
  end

  it 'doesnt login if password isnt correct' do
    post '/api/v1/sessions?email=something@website.com&password=incorrectpassword'

    expect(response).to_not be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:errors])
    expect(user[:errors]).to be_a(Array)
  end

  it 'doesnt login if email param is missing' do
    post '/api/v1/sessions?password=incorrectpassword'

    expect(response).to_not be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:errors])
    expect(user[:errors]).to be_a(Array)
  end

  it 'doesnt login if password param is missing' do
    post '/api/v1/sessions?email=something@website.com'

    expect(response).to_not be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user.keys).to eq([:errors])
    expect(user[:errors]).to be_a(Array)
  end

end
