require 'rails_helper'

RSpec.describe 'Book Search Endpoint' do

  it 'returns books with search query', :vcr do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    books = JSON.parse(response.body, symbolize_names: true)

    # binding.pry
    expect(books).to be_a(Hash)
    expect(books[:data]).to be_a(Hash)
    expect(books[:data][:attributes]).to be_a(Hash)
    expect(books[:data][:attributes][:destination]).to be_a(String)
    expect(books[:data][:attributes][:forecast]).to be_a(String)
    expect(books[:data][:attributes][:total_books_found]).to be_a(Integer)
    expect(books[:data][:attributes][:books]).to be_a(Array)
  end
end
