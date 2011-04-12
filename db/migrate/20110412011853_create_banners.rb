class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.integer :category_id
      t.string :name
      t.datetime :pub_start
      t.datetime :pub_end
      t.integer :clicks
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
