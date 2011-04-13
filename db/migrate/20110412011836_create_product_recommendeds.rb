class CreateProductRecommendeds < ActiveRecord::Migration
  def self.up
    create_table :products_recommendeds, :id => false do |t|
      t.integer :product_id
      t.integer :recommended_id
      t.timestamps
    end
  end

  def self.down
    drop_table :product_recommendeds
  end
end
