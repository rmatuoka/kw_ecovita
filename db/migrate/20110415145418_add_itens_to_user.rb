class AddItensToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone, :string
    add_column :users, :cellphone, :string
    add_column :users, :address, :string
    add_column :users, :number, :string
    add_column :users, :complement, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :cep, :string
  end

  def self.down
    remove_column :users, :phone
    remove_column :users, :phone
    remove_column :users, :cellphone
    remove_column :users, :address
    remove_column :users, :number
    remove_column :users, :complement
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :cep
  end
end
