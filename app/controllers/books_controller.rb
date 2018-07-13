class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @highest_user_rating = @book.lowest_rating
    @lowest_user_rating = @book.highest_rating
  end
end
