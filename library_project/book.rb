class Book
  attr_accessor :title, :author, :category, :subtitle
  def initialize(title, author, category, subtitle = nil)
    @title = title
    @author = author
    @category = category
    @subtitle = subtitle
  end
end