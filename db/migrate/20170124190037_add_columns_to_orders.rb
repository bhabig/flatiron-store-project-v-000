class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :order_id, :integer
  end
end
