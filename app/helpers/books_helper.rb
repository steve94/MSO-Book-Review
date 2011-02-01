module BooksHelper
  
  def cover_for(book, cla = "cover")
    image_tag book.cover.url, {:alt => "#{book.title}", :class => cla} unless book.cover.size == nil
  end
  
  def stars_for(book, max = 5)
    stars = 3.5; string = ""
    (stars/1).to_i.times { |i| string << image_tag('star.png'); max -= 1}
    string << image_tag('halfstar.png'); max -= 1 if stars%1 >= 0.5
    max.times { |i| string << image_tag('blankstar.png')}
    return string.html_safe
  end
end
