class ReceptionsController < ApplicationController
  before_filter :set_book, only: [:take_book, :return_book]
  def new_take_book
    @books = Book.available.order('name asc').pluck(:name, :id)
    @users = User.regular.order('first_name asc').pluck(:email, :id)
  end

  def new_return_book
    @books = Book.unavailable.order('name asc').pluck(:name, :id)
  end

  def take_book
    redirect_to :back , alert: 'Choose user' and return if params[:user_id].blank?
    @book.update(user_id: params[:user_id], status: :unavailable)
    redirect_to new_take_book_receptions_path, notice: 'Book has been successfully taken'
  end

  def return_book
    @book.update(user_id: nil, status: :available)
    redirect_to new_return_book_receptions_path, notice: 'Book has been successfully returned'
  end


  private

  def set_book
    redirect_to :back , alert: 'Choose book' and return if params[:book_id].blank?
    @book = Book.find(params[:book_id])
  end
end