class Book
  attr_accessor :title, :author, :page_count, :fiction

  def initialize(book_props)
    @title = book_props[:title]
    @author = book_props[:author]
    @page_count = book_props[:page_count]
    @fiction = book_props[:fiction]
  end
end
