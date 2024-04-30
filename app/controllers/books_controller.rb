class BooksController < ApplicationController
  def index
    @show_header = true
    @categories = Category.all

    if params[:search].present?
      @books = Book.search_title(params[:search])
      @pagy, @books = pagy(@books.includes(:author), items: 10)
    else
      @pagy, @books = pagy(Book.published.includes(:author), items: 10)
    end
  end

  def show
    @show_header = true
    @book = Book.includes(:author, :category, :book_versions).find(params[:id])
  end
end
