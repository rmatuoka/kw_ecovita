class Gallery < ActiveRecord::Base
  belongs_to :page
  
  has_many :gallery_images
end
