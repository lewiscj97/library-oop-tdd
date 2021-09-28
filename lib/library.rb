class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def all_books
    hash_list = []
    @books.each do |book|
      hash_list << {title: book.title, author: book.author}
    end
    hash_list
  end
end