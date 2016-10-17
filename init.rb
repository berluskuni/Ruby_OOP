require_relative 'app/reader'
require_relative 'app/author'
require_relative 'app/order'
require_relative 'app/book'
require_relative 'app/library'


if File::exists?('./app/library_db/library.yaml')
  library = YAML.load_file('./app/library_db/library.yaml')
  puts 'Who often takes the book?'
  puts library.often_takes_book('Master and Margarita')
  puts 'What is the most popular book?'
  puts library.most_popular_book
  puts 'How many people ordered one of the three most popular books?'
  puts library.one_three_popular_books
else
  File::open('./init_db.txt', 'r') do |file|
    file.each { |line|  eval line.chomp}
  end
  puts 'Who often takes the book?'
  puts library.often_takes_book('Master and Margarita')
  puts 'What is the most popular book?'
  puts library.most_popular_book
  puts 'How many people ordered one of the three most popular books?'
  puts library.one_three_popular_books
  library.dump_file(library)
end