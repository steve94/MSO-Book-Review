class Book < ActiveRecord::Base
  has_many :reviews
  
  belongs_to :author
  belongs_to :genre
  belongs_to :location
  belongs_to :publisher
  
  validates_presence_of :title
  
  def author_name
    author.name if author
  end
  
  def author_name=(name)
    self.author = Author.find_or_create_by_name(name) unless name.blank?
  end
  
  def genre_title
    genre.title if genre
  end
  
  def genre_title=(genre)
    self.genre = Genre.find_or_create_by_title(title) unless title.blank?
  end
  
  def publisher_name
    publisher.name if publisher
  end
  
  def publisher_name=(name)
    self.publisher = Publisher.find_or_create_by_name(name) unless name.blank?
  end
  
end
