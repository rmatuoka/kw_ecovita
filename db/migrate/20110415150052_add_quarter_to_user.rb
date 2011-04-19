class AddQuarterToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :quarter, :string
  end

  def self.down
    remove_column :users, :quarter
  end
end
