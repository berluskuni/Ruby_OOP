require_relative '../app/in_out_file'
class Library
  include InputOutputFile

  attr_accessor :books, :readers, :orders, :authors

  def initialize
    @books, @orders, @readers, @authors  = [], [], [], []

  end
  def often_takes_book(book)
    orders = @orders.select { |order| order.book == book}
    orders = orders.group_by { |order| order.reader}
    orders.sort_by { |name| name.size}.first[0]

  end

  def most_popular_book
    book_by_rate(1)[0][0]
  end

  def one_three_popular_books
    three_books = book_by_rate(3)
    three_books.map { |f| f[1]}.flatten.map { |order| order.reader}.uniq.size

  end

  def book_by_rate(count)
    orders = @orders.group_by { |order| order.book}
    orders.sort_by { |order| order.size }.first(count)
  end

end