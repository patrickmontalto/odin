require 'spec_helper'

describe "Library Object" do

  before :all do
    lib_arr = [
      Book.new("JavaScript: The Good Parts", "Douglas Crockford", :development),
      Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability),
      Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
      Book.new("Responsive Web Design", "Ethan Marcotte", :design)
    ]

    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_arr
    end

  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        expect(lib.books.length).to eql 0
      end
    end

    context "with a yaml file name parameter" do
      it "has five books" do
        expect(@lib.books.length).to eql 5
      end
      
    end
  end

  it "returns all the books in a given category" do
    expect(@lib.get_books_in_category(:development).length).to eql 2
  end

  it "accepts new books" do
    @lib.add_book(Book.new("Designing for the Web", "Mark Boulton", :design))
    expect(@lib.get_book("Designing for the Web")).to be_an_instance_of Book
  end

  it "saves the library" do
    books = @lib.books.map { |book| book.title }
    @lib.save "our_new_library.yml"
    lib2 = Library.new "our_new_library.yml"
    books2 = lib2.books.map { |book| book.title }
    expect(books).to eql books2
  end

end






