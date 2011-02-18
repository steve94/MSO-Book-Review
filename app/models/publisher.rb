class Publisher < ActiveRecord::Base
  has_many :books
  default_scope order(:name)
end
