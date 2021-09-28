require 'library'

describe Library do
  let(:book) { double :book, title: "This is the Title", author: "Lewis"}

  describe "#add_book" do
    it "adds a book to the collection of books" do
      subject.add_book(book)
      expect(subject.books).to include book
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
end