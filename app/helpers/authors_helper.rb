module AuthorsHelper
  def book_sentence_for(author)
    size = @author.books.size
    if size == 0
      output = "Es sind noch keine B&uuml;cher"
    elsif size == 1
      output = "Ein Buch ist bisher"
    else
      output = "Es sind #{size} B&uuml;cher"
    end
    output << " von #{@author.name} auf MSO Books eingetragen."
    output.html_safe
  end
end
