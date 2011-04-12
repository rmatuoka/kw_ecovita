class Banner < ActiveRecord::Base
  attr_accessible :category_id, :name, :pub_start, :pub_end, :clicks, :link
end
