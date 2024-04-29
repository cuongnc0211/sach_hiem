class HomeController < ApplicationController
  def index
    @show_header = true
    @pagy, @books = pagy(Book.includes(:author, :category, :book_versions).all)
    @categories = Category.all
  end
end
