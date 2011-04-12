class Page < ActiveRecord::Base
  attr_accessible :name, :page_title, :body, :published
end
