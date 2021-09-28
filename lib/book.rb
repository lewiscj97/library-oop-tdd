class Book
  attr_reader :title
  attr_reader :author
  attr_writer :damaged
  
  def initialize(title, author)
    @title = title
    @author = author
    @damaged = false
  end

  def damaged?
    @damaged
  end
end