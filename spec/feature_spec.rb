require 'library'
require 'book'

describe Library do
  before(:each) {
    @book = Book.new("Default Title", "Default Author")
    @book2 = Book.new("A new title", "Lewis Jones")
    @book3 = Book.new("Another title", "Lewis Jones")
    @book4 = Book.new("A brand new title", "Lewis Jones")
    @book5 = Book.new("trwrwerw", "Anastasia")
    @book6 = Book.new("Blue Sky", "Terry")
  }

  describe "adding books to the library" do
    it "lets a user add a book to the library and shows the title and author when requested" do
      subject.add_book(@book)
      expect(subject.all_books).to include ({title: "Default Title", author: "Default Author"})
    end

    it "lets a user add multiple books to the library and shows the title and author when requested" do
      subject.add_book(@book)
      subject.add_book(@book2)
      subject.add_book(@book3)
      subject.add_book(@book4)

      expect(subject.all_books).to eq [
        {title: "Default Title", author: "Default Author"},
        {title: "A new title", author: "Lewis Jones"},
        {title: "Another title", author: "Lewis Jones"},
        {title: "A brand new title", author: "Lewis Jones"}
      ]
    end
  end

  describe "damaged books" do
    before(:each) {
      @library = Library.new
      @library.add_book(@book)
      @library.add_book(@book2)
      @library.add_book(@book3)
      @library.add_book(@book4)
    }

    context "has multiple books" do
      it "able to mark one as damaged" do
        @library.mark_damaged(@book2)
        expect(@book2.damaged?).to eq true
      end

      it "returns the count of damaged books when multiple are damaged" do
        @library.mark_damaged(@book3)
        @library.mark_damaged(@book4)
        expect(@library.damaged_book_count).to eq 2
      end
    end
  end

  describe "books by author" do
    before(:each) {
      @library = Library.new
      @library.add_book(@book)
      @library.add_book(@book2)
      @library.add_book(@book3)
      @library.add_book(@book4)
      @library.add_book(@book5)
      @library.add_book(@book6)
    }

    it "lists the books" do
      expect(@library.books_by_author("Lewis Jones")).to eq [
        {title: "A new title", author: "Lewis Jones"},
        {title: "Another title", author: "Lewis Jones"},
        {title: "A brand new title", author: "Lewis Jones"}
      ]
    end

    it "doesn't include books not by that author" do
      expect(@library.books_by_author("Lewis Jones")).to_not include (
        {title: "Blue Sky", author: "Terry"}
      )
    end
  end
end