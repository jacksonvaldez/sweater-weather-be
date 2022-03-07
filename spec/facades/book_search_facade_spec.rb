require 'rails_helper'

RSpec.describe BookSearchFacade do

  describe 'self.search_books' do
    it 'returns an array of book poros and num found', :vcr do
      books = BookSearchFacade.search_books('denver, co')

      expect(books[0].first).to be_a(Book)
      expect(books[1]).to be_a(Integer)
    end
  end
end
