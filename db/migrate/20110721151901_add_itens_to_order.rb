class AddItensToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :zipcode, :string
    add_column :orders, :street, :string
    add_column :orders, :number, :string
    add_column :orders, :complement, :string
    add_column :orders, :neighbourood, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :country, :string
    add_column :orders, :area_code, :string
    add_column :orders, :phone, :string
  end

  def self.down
    remove_column :orders, :phone
    remove_column :orders, :area_code
    remove_column :orders, :country
    remove_column :orders, :state
    remove_column :orders, :city
    remove_column :orders, :neighbourood
    remove_column :orders, :complement
    remove_column :orders, :number
    remove_column :orders, :street
    remove_column :orders, :zipcode
  end
end
