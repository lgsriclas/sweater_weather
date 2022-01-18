class BooksearchSerializer
  include JSONAPI::Serializer

  set_type :book
  attributes :destination, :forecast, :total_books_found, :books
end