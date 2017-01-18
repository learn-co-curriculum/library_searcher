require 'pry'


class Library
  attr_accessor :name, :book_cases

  def initialize(library_props)
    @name = library_props[:name]
    @book_cases = library_props[:book_cases]
  end

  def total_book_count
    # TODO: write your code here
  end

  def all_fiction_titles_with_128_pages
    # TODO: write your code here
  end

  def location_of_longest_book
    # TODO: write your code here
  end

  def has_all_titles_in_collection?(titles)
    # TODO: write your code here
  end

end
