class Product < ActiveRecord::Base
  belongs_to :subcategory
  has_many :product_comments, :dependent => :destroy
  has_many :product_images, :dependent => :destroy
  has_many :wishlists, :dependent => :destroy
  
  has_and_belongs_to_many :recommendeds,
                          :class_name => 'Product',
                          :join_table => 'products_recommendeds',
                          :foreign_key => 'product_id',
                          :association_foreign_key => 'recommended_id'
  
  #RATING
  acts_as_rateable
  accepts_nested_attributes_for :product_comments
  
  #WILL_PAGINATE
  cattr_reader :per_page
  @@per_page = 20
  
  #PAPERCLIP
  has_attached_file :literature
  
  
  
  def self.most_viewed  
    Product.all(:conditions => ['price > 0 AND IF(`products`.`stock_control` = 1, `products`.`stock_quantity` > 0 AND published = 1,  published = 1)'], :order => "views ASC")
  end
  
  def self.six_most_viewed  
    Product.all(:conditions => ['price > 0 AND IF(`products`.`stock_control` = 1, `products`.`stock_quantity` > 0 AND published = 1,  published = 1)'], :order => "views DESC", :limit => 6)
  end
  
  def self.all_published
    Product.all(:conditions => ['price > 0 AND IF(`products`.`stock_control` = 1, `products`.`stock_quantity` > 0 AND published = 1,  published = 1)'])
  end
  
  def self.all_order_by_name_asc
    Product.all(:order => "name ASC")
  end
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
  
  
end
