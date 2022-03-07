class BookSerializer
  def self.index(destination, forecast, books, total_books_found)
    {
      data: {
        id: nil,
        type: 'books',
        attributes: {
          destination: destination,
          forecast: forecast,
          total_books_found: total_books_found,
          books: books
        }
      }
    }
  end
end
