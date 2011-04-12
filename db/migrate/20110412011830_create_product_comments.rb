class CreateProductComments < ActiveRecord::Migration
  def self.up
    create_table :product_comments do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.integer :user_id
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :product_comments
  end
end
