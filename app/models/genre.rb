class Genre < ActiveRecord::Base
  has_many :books
  default_scope order(:title)
end
