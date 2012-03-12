class AddInventoryControlToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :stock_control, :boolean, :default => 0
    add_column :products, :stock_quantity, :integer, :default => 0
  end

  def self.down
    remove_column :products, :stock_quantity
    remove_column :products, :stock_control
  end
end
