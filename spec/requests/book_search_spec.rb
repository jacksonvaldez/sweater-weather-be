require 'rails_helper'

RSpec.describe 'Book Search Endpoint' do

  it 'returns books with search query' do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    books = JSON.parse(response.body, symbolize_names: true)

    expect(books).to be_a(Hash)
    expect(books[:data]).to be_a(Hash)
    expect(books[:data][:attributes]).to be_a(Hash)
    expect(books[:data][:destination]).to be_a(String)
    expect(books[:data][:forecast]).to be_a(String)
    expect(books[:data][:total_books_founds]).to be_a(Integer)
    expect(books[:data][:books]).to be_a(Array)
  end
end
