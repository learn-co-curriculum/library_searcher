require_relative('./library.rb')
require_relative('./book.rb')

def build_library

  book_data = [
    {title: "The Power Broker: Robert Moses and the Fall of New York", author: "Robert A. Caro", page_count: 1344, fiction: false},
    {title: "The Path to Power (The Years of Lyndon Johnson, Volume 1)", author: "Robert A. Caro", page_count: 960, fiction: false},
    {title: "Means of Ascent (The Years of Lyndon Johnson, Volume 2)", author: "Robert A. Caro", page_count: 592, fiction: false},
    {title: "Master Of The Senate (The Years of Lyndon Johnson, Volume 3)", author: "Robert A. Caro", page_count: 1232, fiction: false},
    {title: "The Passage of Power (The Years of Lyndon Johnson, Volume 4)", author: "Robert A. Caro", page_count: 768, fiction: false},
    {title: "Common Ground: A Turbulent Decade in the Lives of Three American Families", author: "J. Anthony Lukas", page_count: 688, fiction: false},
    {title: "Big Trouble: A Murder in a Small Western Town Sets Off a Struggle for the Soul of America", author: "J. Anthony Lukas", page_count: 880, fiction: false},
    {title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz", page_count: 272, fiction: false},
    {title: "Secrets of the JavaScript Ninja", author: "John Resig", page_count: 464, fiction: false},
    {title: "Scientific Progress Goes 'Boink': A Calvin and Hobbes Collection", author: "Bill Watterson", page_count: 128, fiction: true},
    {title: "The Authoritative Calvin and Hobbes (A Calvin And Hobbes Treasury)", author: "Bill Watterson", page_count: 256, fiction: true},
    {title: "Attack of the Deranged Mutant Killer Monster Snow Goons (Calvin & Hobbes)", author: "Bill Watterson", page_count: 128, fiction: true},
    {title: "Something Under the Bed Is Drooling (Calvin & Hobbes)", author: "Bill Watterson", page_count: 128, fiction: true},
    {title: "Weirdos from Another Planet! (Calvin & Hobbes)", author: "Bill Watterson", page_count: 128, fiction: true},
    {title: "The Prize: The Epic Quest for Oil, Money & Power", author: "Daniel Yergin", page_count: 928, fiction: false},
    {title: "The Manuscript Found in Saragossa", author: "Jan Potocki", page_count: 656, fiction: true},
    {title: "The Peripheral", author: "William Gibson", page_count: 496, fiction: true},
    {title: "The Mediterranean and the Mediterranean World in the Age of Philip II, Vol. 1", author: "Fernand Braudel", page_count: 642, fiction: false},
    {title: "The Mediterranean and the Mediterranean World in the Age of Philip II, Vol. 2", author: "Fernand Braudel", page_count: 726, fiction: false},
    {title: "Civilization and Capitalism, 15th-18th Century, Vol. I: The Structure of Everyday Life", author: "Fernand Braudel", page_count: 623, fiction: false},
    {title: "The Cheese and the Worms: The Cosmos of a Sixteenth-Century Miller", author: "Carlo Ginzburg", page_count: 224, fiction: false},
    {title: "Mason & Dixon: A Novel", author: "Thomas Pynchon", page_count: 784, fiction: true},
    {title: "Against The Day", author: "Thomas Pynchon", page_count: 1104, fiction: true},
    {title: "Gravity's Rainbow (Penguin Classics Deluxe Edition)", author: "Thomas Pynchon", page_count: 776, fiction: true},
    {title: "Moby Dick", author: "Herman Melville", page_count: 752, fiction: true},
    {title: "Francis Parkman : France and England in North America : Vol. 1", author: "Francis Parkman", page_count: 1204, fiction: false},
    {title: "Francis Parkman : France and England in North America : Vol. 2", author: "Francis Parkman", page_count: 1320, fiction: false},
    {title: "Collected Essays", author: "James Baldwin", page_count: 869, fiction: false},
    {title: "The Hunger Games", author: "Suzanne Collins", page_count: 384, fiction: true},
    {title: "Catching Fire", author: "Suzanne Collins", page_count: 400, fiction: true},
    {title: "Mocking Jay", author: "Suzanne Collins", page_count: 400, fiction: true},
    {title: "Cracking the Coding Interview", author: "Gayle Laakmann Mcdowell", page_count: 742, fiction: false},
    {title: "Structure and Interpretation of Computer Programs", author: "Abelson and Sussmnan", page_count: 657, fiction: true},

  ]

  shuffled_books = (book_data.shuffle + book_data.shuffle).map do |book_props|
    Book.new(book_props)
  end

  book_cases = [
    {row_id: "A", shelves: {
      '1' => shuffled_books.pop(rand(2..5)),
      '2' => shuffled_books.pop(rand(2..5)),
      '3' => shuffled_books.pop(rand(2..5)),
      '4' => shuffled_books.pop(rand(2..5))}
    },
    {row_id: "B", shelves: {
      '1' => shuffled_books.pop(rand(2..5)),
      '2' => shuffled_books.pop(rand(2..5)),
      '3' => shuffled_books.pop(rand(2..5)),
      '4' => shuffled_books.pop(rand(2..5))}
    },
    {row_id: "C", shelves: {
      '1' => shuffled_books.pop(rand(2..5)),
      '2' => shuffled_books.pop(rand(2..5)),
      '3' => shuffled_books.pop(rand(2..5)),
      '4' => shuffled_books.pop(rand(2..5))}
    }
  ]

  Library.new({name: "Adam Jonas Public Library", book_cases: book_cases })
end
