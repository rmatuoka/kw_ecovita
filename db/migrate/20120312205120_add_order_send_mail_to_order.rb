class AddOrderSendMailToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :order_send_mail, :boolean, :default => 0
  end

  def self.down
    remove_column :orders, :order_send_mail
  end
end
