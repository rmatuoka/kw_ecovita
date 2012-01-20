class ProductImage < ActiveRecord::Base
  belongs_to :product
  
  has_attached_file :image, :styles => { :medium => "290x290>", :thumb => "100x128>" }
end
