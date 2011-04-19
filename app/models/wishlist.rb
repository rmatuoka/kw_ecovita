class Wishlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  
  cattr_reader :per_page
  @@per_page = 20
  
end
