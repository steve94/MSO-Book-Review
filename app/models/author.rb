class Author < ActiveRecord::Base
  has_many :books
  
  default_scope order(:name)
  
  def rating
    stars = 0; count = 0
    books.each do |book|
      unless book.rating == 0
        stars += book.rating
        count += 1
      end
    end
    unless count == 0
      stars = stars.to_f / count
    else
      0
    end
  end
  
  def genres_count
    genres = Hash.new(0)
    books.each { |book| genres[book.genre_id] += 1 }
    genres
  end
  
  def genres
    genres = Array.new
    genres_count.each_key { |key| genres << Genre.find_by_id(key) }
    genres
  end
end
