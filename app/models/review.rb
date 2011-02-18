class Review < ActiveRecord::Base
  has_many :comments
  belongs_to :book
  validates_presence_of :title, :rating, :body
end
