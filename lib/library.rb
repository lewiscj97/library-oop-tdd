class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def all_books
    @books.map { |book| {title: book.title, author: book.author} }
  end
end