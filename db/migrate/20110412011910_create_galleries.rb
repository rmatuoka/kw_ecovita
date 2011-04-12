class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name
      t.integer :page_id
      t.boolean :published
      t.integer :clicks
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
