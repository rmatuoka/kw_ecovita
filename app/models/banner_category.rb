class BannerCategory < ActiveRecord::Base
  has_many :banners, :dependent => :destroy
  
  def self.lateral
    BannerCategory.first(:conditions => ['name = ?', 'Lateral'])
  end
end
