class BookSearchFacade

  def self.search_books(q)
    response = BookSearchService.search_books(q)

    response[:docs].map do |book_data|
      Book.new(book_data)
    end
  end

end
