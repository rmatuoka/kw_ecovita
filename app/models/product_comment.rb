class ProductComment < ActiveRecord::Base
  belongs_to :product
  
  def self.all_published
    ProductComment.all(:conditions => ['published = 1'])
  end
end
