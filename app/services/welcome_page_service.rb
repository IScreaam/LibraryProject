class WelcomePageService
  def call
    OpenStruct.new(
        books_count: Book.count,
        available_books_count: Book.available.count,
        unvailable_books_count: Book.unavailable.count,
        users_count: User.regular.count,
        user_with_books: User.with_books.count
    )
  end
end