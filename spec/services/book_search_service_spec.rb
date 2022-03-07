require 'rails_helper'

RSpec.describe BookSearchService do

  describe 'self.search_books' do
    it 'returns a hash', :vcr do
      response = BookSearchService.search_books('denver,co')
      expect(response).to be_a(Hash)
    end
  end

end
