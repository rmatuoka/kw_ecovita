class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, :dependent => :destroy
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
end
