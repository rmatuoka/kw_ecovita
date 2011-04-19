class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :summary
      t.decimal :price
      t.decimal :discount
      t.text :features
      t.text :description
      t.text :usage
      t.datetime :pub_start
      t.datetime :pub_end
      t.integer :views
      t.integer :subcategory_id
      t.boolean :published
      t.string :tweet_text
      t.string :like_link
      t.string :video
      t.integer :vendas
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
