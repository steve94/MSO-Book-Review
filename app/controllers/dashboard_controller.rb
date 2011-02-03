class DashboardController < ApplicationController
  
  def index
    @books = (Book.all.sort_by { |b| b.rating }).reverse
    @new_book = (@books.sort_by {|b| b.created_at}).reverse.first
  end
end