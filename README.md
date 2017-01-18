# Library Searcher

## Objectives
1. Retrieve information from a nested data structure containing several different data-types

## Instructions

Your local public library has a wide selection of books but stores them in no discernible order. Your task is to write some methods that can help us find the books we are looking for!

### The Data Structure

Our top level object is an instance of the Library class.  The methods you will be writing will be instance methods of this class.

A library has an instance variable `@book_cases` which references some data structured like this:

```ruby
[
  {row_id: "A", shelves: {
    '1' => [<Book>, <Book>,... ]),
    '2' => [<Book>, <Book>,... ]),
    '3' => [<Book>, <Book>,... ]),
    '4' => [<Book>, <Book>,... ])}
  },
  {row_id: "B", shelves: {
    '1' => [<Book>, <Book>,... ]),
    '2' => [<Book>, <Book>,... ]),
    '3' => [<Book>, <Book>,... ]),
    '4' => [<Book>, <Book>,... ])}
  },
  {row_id: "C", shelves: {
    '1' => [<Book>, <Book>,... ]),
    '2' => [<Book>, <Book>,... ]),
    '3' => [<Book>, <Book>,... ]),
    '4' => [<Book>, <Book>,... ])}
  }
]
```

Let's walk through the `@book_cases` data structure one step at a time.

It is an **array** of 3 **hashes**. Each **hash** represents an individual book case. The book case hash has two key-value pairs. One key indicates the book case's *row id*, which is a single character **string**. The value of the `:shelves` key is itself another **hash**. Each key of this hash is a **string** representing that individual shelf's *shelf number*. Each shelf number points to an **array** of **Book** Objects.  A book object has several properties such as `title`, `author`, `page_count`.  Check `book.rb` to see all the properties of a book object.

Diving deep into this data structure will definitely requiring some serious method chaining and it will be easy to lose track of where you are at.

##One-dot-at-a-time Example

Imagine you wanted to write an instance method `#get_specific_book_title` that returns the title of the *first book* on the *third shelf* of the *last book case*.

```ruby
class Library
  attr_accessor :name, :book_cases
  # ...
  def get_specific_book_title
    self.book_cases.last[:shelves]['3'].first.title
  end
end
```

So many dots in one line can be sort of daunting so let's break that down one dot at a time.

**Ruby will always *evaluate* the code on the left hand side of each dot and that expression will return some value. The next method in the chain is operating on that return value.**

Starting with the first expression:

- `self`

We are inside of an instance method of the `Library` class so `self` is a specific library instance. That means the next thing we do in the method chain is calling an instance method on the library object. In fact, if we tried to call a method that a library instance did not have, ex: `self.whatever` the code will error with something like: `NoMethodError: undefined method 'whatever' for <Library:0x007f9b06878900>`

Luckily, the next thing we call is `book_cases` which is the reader method available to us from to the `attr_accessor`

- `self`
- `self.book_cases`

At this point we have an **array**. Yes, It is a deeply nested array, but we don't need to worry about that for now. It's great to keep in mind the *type of the current value* because it can help us choose what methods to call next. Since we currently have an array we should only be thinking about about the things we normally do to arrays. Usually that's iterate or grab the value at a specific index. In this case we are calling the `last` method which is a built-in method all Ruby arrays have.

- `self`
- `self.book_cases`
- `self.book_cases.last`

If we refer to the data structure at the top the page we'll see that this expression returns a **hash**. Sometimes we iterate over hashes but the most common operation we do is access a hash at a certain key which returns a value. That's exactly what we want to do here. We want the value at the `:shelves` key.

- `self`
- `self.book_cases`
- `self.book_cases.last`
- `self.book_cases.last[:shelves]`

This is interesting because so far we have been talking about calling methods and chaining methods with `.`s but here it's not obvious that there is a method being called. There actually is a method being called, it's just a little hidden by some ruby syntactic sugar.  Open up IRB and try this:
```ruby
hash = {}
hash[:a] = 1
=> 1
# all good so far, now lets try
hash = nil
hash[:a] = 1
# You will see
# NoMethodError: undefined method `[]' for nil:NilClass
```
hmm.. what is going on? When we use the bracket notation to access a hash at a certain key, the way ruby actually interprets this is calling the `[]` method on the object with the key as the argument. It would be sort of weird to do so and we will basically always use the bracket notation, but if wanted to get the value at the `:name` key in this hash `student = {name: 'Antoin'}`, we could do that by writing `student.[](:name)`.  
This is good to keep in mind because the rule that the expression to the left of the dot will evaluate and return still applies here even though the `.` is sort of hidden when we use the bracket notation.
So at this point we're at `self.book_cases.last[:shelves]`. That expression evaluates and returns yet another **hash**. The hash that is the value of the `:shelves` key.

- `self`
- `self.book_cases`
- `self.book_cases.last`
- `self.book_cases.last[:shelves]`
- `self.book_cases.last[:shelves]['3']`

We said that normally we work with hashes by giving them a key and getting back the value. We'll do the same here! Again using the bracket notation that is a method call in disguise we'll get the value at the key of `'3'`. The data-type that we are now working with will be an array

- `self`
- `self.book_cases`
- `self.book_cases.last`
- `self.book_cases.last[:shelves]`
- `self.book_cases.last[:shelves]['3'].first`

We're almost there and our Book objects are now in sight. They are just wrapped inside of an array. The methods available to us in our toolbox now are all the methods that an Array has. Using the `first` method we'll grab the first book out of the array. This expression returns an instance of the Book class.

- `self`
- `self.book_cases`
- `self.book_cases.last`
- `self.book_cases.last[:shelves]`
- `self.book_cases.last[:shelves]['3'].first.title`

Finally we have the book object we want.  The only step left is that rather than returning the whole object we want to return the book's title as a String.  That's easy enough. If we look at the `Book` class definition in `book.rb` we can see what methods are available to us.  While it may look like there's only one method there, `initialize`, remember that the `attr_accessor` macro is actually just a shorthand way of writing getter and setter methods.  Let's use the `title` getter to grab the desired string off of the full Book object.

## To Keep in Mind
When going through this lab and navigating down into the deeply nested data structure you may find your task easier if you can always answer the question 'What type of thing am I working with right now?'.
Knowing that, for example, the object you are working with is a Hash is great information to have because it can help you determine what the next step needs to be.  This will also help explain strange errors such as `Undefined method: 'each' for ...` that tell you a method you know exists is undefined.  It's not that the method disappeared, but rather that you are calling it on the wrong type of thing.  Double check that you are in fact calling that method on the type of thing you think you are.
