class BannerCategory < ActiveRecord::Base
  has_many :banners, :dependent => :destroy
  
  def self.lateral
    BannerCategory.first(:conditions => ['name = ?', 'Lateral'])
  end
  
  def self.home
    BannerCategory.first(:conditions => ['name = ?', 'Home'])
  end
end
