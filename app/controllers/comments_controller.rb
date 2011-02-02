class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])

    @review  = Review.find(params[:review_id])
    @comment = @review.comments.create!(params[:comment])
    redirect_to book_review_path(@review.book, @review), :notice => "Kommentar wurde erstellt"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy

    redirect_to book_review_path(@review.book, @review), :notice => "Kommentar wurde entfernt"
  end
end
