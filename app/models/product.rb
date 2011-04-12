class Product < ActiveRecord::Base
  attr_accessible :name, :summary, :price, :discount, :features, :description, :usage, :pub_start, :pub_end, :views, :category_id, :published, :tweet_text, :like_link, :video, :vendas
end
