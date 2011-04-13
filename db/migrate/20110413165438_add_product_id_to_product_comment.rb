class AddProductIdToProductComment < ActiveRecord::Migration
  def self.up
    add_column :product_comments, :product_id, :integer
  end

  def self.down
    remove_column :product_comments, :product_id
  end
end
