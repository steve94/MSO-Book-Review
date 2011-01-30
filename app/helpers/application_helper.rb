module ApplicationHelper
  
  def auto_complete_input(object_name, method, title, path)
    js_options = {:url => path, :method => :get, :with => "'search=' + element.value"}
    
    output = "<div class=\"input text auto_complete optional\">\n"
    output << "<label class=\"text auto_complete optional\">#{title}</label>"
    output << text_field_with_auto_complete(object_name, method,{:class => "string auto_complete optional"},js_options)
  
    output << "</div>"
    return output.html_safe
  end
end
