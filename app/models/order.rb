class Order < ActiveRecord::Base
  attr_accessible :user_id, :status, :address_id, :shipping
end
