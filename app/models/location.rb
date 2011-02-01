class Location < ActiveRecord::Base
  has_many :books
  
  def shelf
    shelf_number.to_s + " \"" + title + "\""
  end
end
