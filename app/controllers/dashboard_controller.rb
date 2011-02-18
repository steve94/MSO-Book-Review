class DashboardController < ApplicationController
  
  def index
    @books = (Book.all.sort_by { |b| b.rating }).reverse
    @new_book = (@books.sort_by {|b| b.created_at}).reverse.first
    @authors = (Author.all.sort_by { |a| a.rating }).reverse
    @genres = Genre.all
  end
end