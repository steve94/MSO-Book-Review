module ApplicationHelper
  
  def auto_complete_input(object, method, title, path) # This are for required fields
    js_options = {:url => path, :method => :get, :with => "'search=' + element.value"}
    
    output = "<div class=\"input string  required\">\n"
    output << "<label class=\"string auto_complete required\">* #{title}</label>"
    output << text_field_with_auto_complete(object, method,{:class => "string auto_complete required", :size => 50},js_options)
  
    output << "</div>"
    return output.html_safe
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
