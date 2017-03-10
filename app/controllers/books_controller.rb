class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.with_status(params[:status]).includes(:user).order('books.name')
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: 'book successfully created'
    else
      redirect_to new_book_path, alert: @book.errors.full_messages.join(', ')
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path, notice: 'book successfully updated'
    else
      redirect_back_or_to(book_path(@book), alert: 'Can not update the book')
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_path, notice: 'book successfully deleted'
    else
      redirect_to book_path(@book), alert: 'Can not delete the book'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name,
                                 :author_name,
                                 :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
