require 'book'

describe Book do
  describe "#initialize" do
    it "adds a title and an author property" do
      Book.new("This is the Title", "Lewis Jones")
    end
  end

  describe "#title" do
    it "returns the title of the book" do
      book = Book.new("This is the Title", "Lewis Jones")
      expect(book.title).to eq "This is the Title"
    end
  end

  describe "#author" do
    it "returns the author of the book" do
      book = Book.new("This is the Title", "Lewis Jones")
      expect(book.author).to eq "Lewis Jones"
    end
  end

  describe "#damaged" do
    it "sets whether the book is damaged or not" do
      book = Book.new("This is the Title", "Lewis Jones")
      book.damaged = true
      expect(book.damaged?).to eq true
    end
  end
end