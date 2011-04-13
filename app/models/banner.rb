class Banner < ActiveRecord::Base
  belongs_to :banner_category
  
  #has_and_belongs_to_many :pages
end
