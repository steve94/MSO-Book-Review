module BooksHelper
  
  def cover_for(book, cla = "cover")
    image_tag book.cover.url, {:alt => "#{book.title}", :class => cla} unless book.cover.size == nil
  end
  
  def stars_for(stars, max = 5)
    string = ""
    (stars/1).to_i.times { string << image_tag('star.png'); max -= 1}
    if stars%1 >= 0.5
      string << image_tag('halfstar.png')
      max -= 1 
    end
    max.times {string << image_tag('blankstar.png')}
    return string.html_safe
  end
end
