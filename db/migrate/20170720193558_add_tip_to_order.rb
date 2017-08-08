class AddTipToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :tip_amount, :decimal, precision: 5, scale: 2
  end
end
