require 'library'

describe Library do
  let(:book) { double :book, title: "This is the Title", author: "Lewis"}

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
      allow(book).to receive(:damaged=) { true }
      allow(book).to receive(:damaged?) { true }
      subject.add_book(book)
      subject.mark_damaged(book)
      expect(book.damaged?).to eq true
    end
  end

  describe "#damaged_book_count" do
    it "returns the number of damaged books" do
      allow(book).to receive(:damaged=) { true }
      allow(book).to receive(:damaged?) { true }

      subject.add_book(book)
      subject.add_book(book)
      subject.add_book(book)

      expect(subject.damaged_book_count).to eq 3
    end
  end
end