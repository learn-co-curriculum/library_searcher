require 'spec_helper'

describe 'Library' do

  let(:library) { build_library }

  describe '#book_count' do
    it 'counts the total number of books in the library' do
      expect(library.total_book_count).to eq(48)
    end
  end

  describe '#all_fiction_titles_with_128_pages' do
    it 'returns an array of unique titles of fiction books that have 128 pages' do
      result = library.all_fiction_titles_with_128_pages

      expect(result).to contain_exactly(
        "Scientific Progress Goes 'Boink': A Calvin and Hobbes Collection",
        "Attack of the Deranged Mutant Killer Monster Snow Goons (Calvin & Hobbes)",
        "Something Under the Bed Is Drooling (Calvin & Hobbes)",
        "Weirdos from Another Planet! (Calvin & Hobbes)")
    end
  end

  describe '#location_of_longest_book' do
    it 'returns book case row_id and shelf number of non-fiction book with the most pages' do
      location = library.location_of_longest_book

      expect(location[:row_id]).to eq "B"
      expect(location[:shelf_number]).to eq "4"
    end
  end

  describe '#has_all_titles_in_collection?' do
    it 'given an array of titles returns the boolean value of whether the given library contains all the books' do

      collection = [
        "The Path to Power (The Years of Lyndon Johnson, Volume 1)",
        "Means of Ascent (The Years of Lyndon Johnson, Volume 2)",
        "Master Of The Senate (The Years of Lyndon Johnson, Volume 3)",
        "The Passage of Power (The Years of Lyndon Johnson, Volume 4)"
      ]

      expect(library.has_all_titles_in_collection?(collection)).to be true
    end
  end
end
