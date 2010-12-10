class Book < ActiveRecord::Base
  has_many :reviews
  
  belongs_to :author
  belongs_to :genre
  belongs_to :location
  belongs_to :publisher
end
