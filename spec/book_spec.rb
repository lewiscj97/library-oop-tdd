require 'book'

describe Book do
  describe "#initialize" do
    it "adds a title and an author property" do
      Book.new("This is the Title", "Lewis Jones")
    end
  end
end