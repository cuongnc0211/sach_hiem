class BooksController < ApplicationController
  def index
    @pagy, @books = pagy(Book.includes(:author, :category, :book_versions).all)
    @categories = Category.all
  end

  def show
    @book = Book.includes(:author, :category, :book_versions).find(params[:id])
  end
end
