class BookSearchService

  def self.conn
    Faraday.new(url: 'https://openlibrary.org')
  end

  def self.search_books(q)
    response = conn.get('search.json') do |req|
      req.params['q'] = q
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
