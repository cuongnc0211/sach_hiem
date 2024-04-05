class HomeController < ApplicationController
  def index
    @pagy, @books = pagy(Book.includes(:author, :category, :book_versions).all)
  end
end
