class BooksSerializer
  attr_reader :books

  def initialize(books)
    @books = books
  end

  def as_json
    books.map do |book|
      {
        id: book.id,
        title: book.title,
        publisher: book.publisher,
        published_on: book.published_on,
        author_id: book.author_id,
        user_id: book.user_id
      }
    end
  end
end
