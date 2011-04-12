class ProductComment < ActiveRecord::Base
  attr_accessible :name, :email, :comment, :user_id, :published
end
