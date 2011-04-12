class Gallery < ActiveRecord::Base
  attr_accessible :name, :page_id, :published, :clicks
end
