module ApplicationHelper
  
  def auto_complete_input(object, method, title, path) # This are for required fields
    js_options = {:url => path, :method => :get, :with => "'search=' + element.value"}
    
    output = "<div class=\"input string  required\">\n"
    output << "<label class=\"string auto_complete required\">* #{title}</label>"
    output << text_field_with_auto_complete(object, method,{:class => "string auto_complete required", :size => 50},js_options)
  
    output << "</div>"
    return output.html_safe
  end
end
