class AddBibliographyToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :bibliography, :text
  end

  def self.down
    remove_column :products, :bibliography
  end
end
