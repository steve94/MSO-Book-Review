class ReviewsController < ApplicationController
  
  def show
    @review = Review.find(params[:id])
  end

  def create
    @book  = Book.find(params[:book_id])
    @book.reviews.create!(params[:review])
    redirect_to @book, :notice => "Bewertung wurde erstellt"
  end

  def destroy
    @review = Review.find(params[:id])
    @book = @review.book
    @review.comments.each do |comment|
      comment.destroy
    end
    @review.destroy

    redirect_to @book, :notice => "Bewertung wurde entfernt"
  end
end
