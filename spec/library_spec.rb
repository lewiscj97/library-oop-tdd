require 'library'

describe Library do
  let(:book) { double :book, title: "This is the Title", author: "Lewis", "damaged=": true, damaged?: true}

  describe "#add_book" do
    it "adds a book to the collection of books" do
      subject.add_book(book)
      expect(subject.all_books).to include ({title: "This is the Title", author: "Lewis"})
    end
  end

  describe "#all_books" do
    it "lists all the books in the library" do
      subject.add_book(book)
      subject.add_book(book)

      expect(subject.all_books).to eq [
        {title: "This is the Title", author: "Lewis"},
        {title: "This is the Title", author: "Lewis"}
      ]
    end
  end
  
  describe "#mark_damaged" do
    it "marks a book as damaged" do
      subject.add_book(book)
      subject.mark_damaged(book)
      expect(book.damaged?).to eq true
    end
  end

  describe "#damaged_book_count" do
    it "returns the number of damaged books" do
      subject.add_book(book)
      subject.add_book(book)
      subject.add_book(book)

      expect(subject.damaged_book_count).to eq 3
    end
  end

  describe "#books_by_author" do
    let(:book2) { double :book, title: "This is another Title", author: "Lewis"}
    let(:book3) { double :book, title: "This is another Title", author: "Ana"}

    it "returns a list of books by a specific author" do
      subject.add_book(book)
      subject.add_book(book2)
      subject.add_book(book3)

      expect(subject.books_by_author("Lewis")).to include book, book2
    end
  end
end