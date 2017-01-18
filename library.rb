require 'pry'

class Library
  attr_accessor :name, :book_cases

  def initialize(library_props)
    @name = library_props[:name]
    @book_cases = library_props[:book_cases]
  end


end
