require 'rails_helper'

RSpec.describe BackgroundSerializer do

  it 'returns correct hash' do
    hash = BackgroundSerializer.show('denver', 'http...')

    expect(hash.keys).to eq([:data])
    expect(hash[:data].keys).to eq([:type, :id, :attributes])
    expect(hash[:data][:type]).to eq('image')
    expect(hash[:data][:id]).to eq(nil)
    expect(hash[:data][:attributes]).to be_a(Hash)
    expect(hash[:data][:attributes].keys).to eq([:location, :url])
    expect(hash[:data][:attributes][:location]).to eq('denver')
    expect(hash[:data][:attributes][:url]).to eq('http...')
  end

end
