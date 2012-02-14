class AddCompletedToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :completed, :boolean
  end

  def self.down
    remove_column :orders, :completed
  end
end
