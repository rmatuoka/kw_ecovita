class CreatePageBanners < ActiveRecord::Migration
  def self.up
    create_table :pages_banners, :id => false do |t|
      t.integer :page_id
      t.integer :banner_id
      t.timestamps
    end
  end

  def self.down
    drop_table :page_banners
  end
end
