class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.string :gift_code
      t.boolean :used
      t.datetime :valid
      t.decimal :discount
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
