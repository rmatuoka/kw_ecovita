class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products, :dependent => :destroy
  
  scoped_search :in => :user, :on => [:nome, :sobrenome, :email]
  scoped_search :on => [:pagseguro_id]
end
