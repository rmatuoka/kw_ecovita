class BannerCategory < ActiveRecord::Base
  has_many :banners
  
  def self.lateral
    BannerCategory.first(:conditions => ['name = ?', 'Lateral'])
  end
end
