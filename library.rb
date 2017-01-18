require 'pry'

class Library
  attr_accessor :name, :book_cases

  def initialize(library_props)
    @name = library_props[:name]
    @book_cases = library_props[:book_cases]
  end

  def total_book_count
    num_books = 0

    self.book_cases.each do |book_case|
      book_case[:shelves].each do |shelf_number, books|
        num_books += books.length
      end
    end

    num_books
  end

  def all_fiction_titles_with_128_pages
    results = []

    self.book_cases.each do |book_case|
      book_case[:shelves].each do |shelf_number, books|
        books.each do |book|
          results << book.title if book.page_count == 128
        end
      end
    end

    results.uniq
  end

  def location_of_longest_book
    books = get_all_books
    longest = book_with_max_page_count(books)

    result = {}

    self.book_cases.each do |book_case|
      book_case[:shelves].each do |shelf_number, books|
        if books.include?(longest)
          result[:row_id] = book_case[:row_id]
          result[:shelf_number] = shelf_number
        end
      end
    end

    result
  end

  def has_all_titles_in_collection?(titles)
    all_titles = get_all_books.map { |book| book.title }
    titles.all? { |title| all_titles.include?(title)}
  end

  private

  def book_with_max_page_count(books)
    books.max_by do |book|
      book.page_count
    end
  end

  def get_all_books
    all_books = []

     self.book_cases.each do |book_case|
       book_case[:shelves].each do |shelf_number, books|
         all_books << books
       end
     end

     all_books.flatten
  end


end
