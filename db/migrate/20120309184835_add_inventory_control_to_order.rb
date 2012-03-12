class AddInventoryControlToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :adjust_stock, :boolean
    add_column :orders, :shipping_value, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :orders, :shipping_value
    remove_column :orders, :adjust_stock
  end
end
