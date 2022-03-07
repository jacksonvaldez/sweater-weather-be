class BookSearchFacade

  def self.search_books(q)
    response = BookSearchService.search_books(q)

    books = response[:docs].map do |book_data|
      Book.new(book_data)
    end

    [books, response[:numFound]]
  end

end
