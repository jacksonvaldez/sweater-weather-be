require 'rails_helper'

RSpec.describe Book do

  before(:each) do
    book_data = {
      isbn: ['isbn1', 'isbn2'],
      title: 'title',
      publisher: 'publisher'
    }
    @book = Book.new(book_data)
  end

  it 'exists' do
    expect(@book).to be_a(Book)
  end

  it 'attribtues' do
    expect(@book.isbn).to eq(['isbn1', 'isbn2'])
    expect(@book.title).to eq('title')
    expect(@book.publisher).to eq('publisher')
  end
end
