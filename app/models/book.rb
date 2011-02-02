class Book < ActiveRecord::Base
  has_many :reviews
  
  belongs_to :author
  belongs_to :genre
  belongs_to :location
  belongs_to :publisher
  
  validates_presence_of :title, :author, :genre, :location, :publisher, :description
  
  has_attached_file :cover,
                    :url => "/covers/:id.:extension",
                    :path => ":rails_root/public/covers/:id.:extension"
  validates_attachment_content_type :cover,
                                    :content_type => ['image/jpeg', 'image/png'],
                                    :message => "Muss ein Bild im jpeg- oder png.Format sein."
  validates_attachment_size :cover, :less_than => 5.megabytes

  default_scope order(:title)
  
  
  def author_name
    author.name if author
  end
  
  def author_name=(name)
    self.author = Author.find_or_create_by_name(name) unless name.blank?
  end
  
  def genre_title
    genre.title if genre
  end
  
  def genre_title=(title)
    self.genre = Genre.find_or_create_by_title(title) unless title.blank?
  end
  
  def publisher_name
    publisher.name if publisher
  end
  
  def publisher_name=(name)
    self.publisher = Publisher.find_or_create_by_name(name) unless name.blank?
  end
  
  def shelf
    location.shelf if location
  end
  
  def rating
    unless reviews.size == 0
      stars = 0
      reviews.each{ |e| stars += e.rating}
      return stars = stars.to_f / reviews.size
    else
      return 0
    end
  end
  
  def year
    published.strftime('%Y')
  end
  
end