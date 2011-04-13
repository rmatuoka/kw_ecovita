class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :image, :styles => { :thumb => "125x125>", :c_medio => "550x550>" }
end
