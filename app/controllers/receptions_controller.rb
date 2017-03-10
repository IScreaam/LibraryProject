class ReceptionsController < ApplicationController
  before_filter :set_book, only: [:take_book, :return_book]
  def new_take_book
    @books = Book.available.order('name asc').pluck(:name, :id)
    @users = User.order('first_name asc').pluck(:email, :id)
  end

  def new_return_book
    @books = Book.unavailable.order('name asc').pluck(:name, :id)
  end

  def take_book
    @book.update(user_id: params[:user_id], status: :unavailable)
    redirect_to new_take_book_receptions_path, notice: 'Book has been successfully taken'
  end

  def return_book
    @book.update(user_id: nil, status: :available)
    redirect_to new_return_book_receptions_path, notice: 'Book has been successfully returned'
  end


  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end