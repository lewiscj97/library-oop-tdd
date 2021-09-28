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

  def mark_damaged(book)
    book.damaged = true
  end

  def damaged_book_count
    count = 0
    @books.each { |book| count += 1 if book.damaged? == true }
    count
  end
end