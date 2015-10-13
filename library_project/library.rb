require 'yaml'

class Library
  attr_accessor :books

  def initialize (load_file = false)
    @lib_file = load_file
    @books = @lib_file ? YAML::load(File.read(@lib_file)) : []
  end

  def get_books_in_category(category)
    @books.select { |book| book.category == category }
  end

  def add_book(book)
    @books << book
  end

  def get_book(title)
    @books.select { |book| book.title == title }.first
  end

  def save(save_file = false)
    @lib_file = save_file || @lib_file || "library.yml"
    File.open @lib_file, "w" do |f|
      f.write YAML::dump @books
    end
  end

end