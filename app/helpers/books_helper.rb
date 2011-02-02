module BooksHelper
  
  def cover_for(book, cla = "cover")
    image_tag book.cover.url, {:alt => "#{book.title}", :class => cla} unless book.cover.size == nil
  end
  
end
