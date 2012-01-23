class Banner < ActiveRecord::Base
  belongs_to :banner_category
  
  #has_and_belongs_to_many :pages
  has_attached_file :image, :styles => { :thumb => "125x125>", :c_medio => "550x550>" }
  
  #,
  #    :url => "/uploads/:attachment/:id/:basename_:style.:extension",
  #    :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
  
  def url_slug()
    "#{id}-#{name.parameterize}"
  end
end
