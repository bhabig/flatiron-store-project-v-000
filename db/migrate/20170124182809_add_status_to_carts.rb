class AddStatusToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :status, :boolean, default: false
  end
end
