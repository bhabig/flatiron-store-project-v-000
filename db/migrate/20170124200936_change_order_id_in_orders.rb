class ChangeOrderIdInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :order_id, :cart_id
  end
end
