class Product < ActiveRecord::Base
  belongs_to :category
  
  has_many :product_comments
  has_many :product_images
  
  has_and_belongs_to_many :recommendeds,
                          :class_name => 'Product',
                          :join_table => 'products_recommendeds',
                          :foreign_key => 'product_id',
                          :association_foreign_key => 'recommended_id'

end
