describe Library do
  let(:book) { double :book }

  describe "#add_book" do
    it "adds a book to the collection of books" do
      subject.add_book(book)
      expect(subject.books).to include book
    end
  end
end