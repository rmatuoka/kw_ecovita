class Product < ActiveRecord::Base
  belongs_to :subcategory
  has_many :product_comments
  has_many :product_images
  has_many :wishlists
  
  has_and_belongs_to_many :recommendeds,
                          :class_name => 'Product',
                          :join_table => 'products_recommendeds',
                          :foreign_key => 'product_id',
                          :association_foreign_key => 'recommended_id'

  acts_as_rateable
  accepts_nested_attributes_for :product_comments
  
  cattr_reader :per_page
  @@per_page = 20
  
  
  
  def self.most_viewed  
    Product.all(:conditions => ['published = 1'], :order => "views ASC")
  end
  
  def self.six_most_viewed  
    Product.all(:conditions => ['published = 1'], :order => "views DESC", :limit => 6)
  end
  
  def self.all_published
    Product.all(:conditions => ['published = 1'])
  end
  
  
end
