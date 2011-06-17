class Page < ActiveRecord::Base
  has_many :galleries, :dependent => :destroy
  #has_and_belongs_to_many :banners
end
