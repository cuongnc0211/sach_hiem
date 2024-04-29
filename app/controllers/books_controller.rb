class BooksController < ApplicationController
  def index
    @show_header = true
    @pagy, @books = pagy(Book.includes(:author, :category, :book_versions).all)
    @categories = Category.all
  end

  def show
    @show_header = true
    @book = Book.includes(:author, :category, :book_versions).find(params[:id])
  end
end
