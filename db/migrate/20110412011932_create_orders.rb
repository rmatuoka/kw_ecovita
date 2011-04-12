class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.string :status
      t.integer :address_id
      t.decimal :shipping
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
