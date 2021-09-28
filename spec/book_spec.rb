require 'book'

describe Book do
  before(:each) { @book = Book.new("This is the Title", "Lewis Jones") }
  
  describe "#title" do
    it "returns the title of the book" do
      expect(@book.title).to eq "This is the Title"
    end
  end

  describe "#author" do
    it "returns the author of the book" do
      expect(@book.author).to eq "Lewis Jones"
    end
  end

  describe "#damaged" do
    it "sets whether the book is damaged or not" do
      @book.damaged = true
      expect(@book.damaged?).to eq true
    end
  end
end