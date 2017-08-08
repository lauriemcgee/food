class AddDecimals < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :decimal, precision: 9, scale: 2
    add_column :orders, :subtotal, :decimal, precision: 9, scale: 2
    add_column :orders, :tax, :decimal, precision: 9, scale: 2
    remove_column :carted_foods, :tax, :decimal
    remove_column :carted_foods, :total, :decimal
  end
end
