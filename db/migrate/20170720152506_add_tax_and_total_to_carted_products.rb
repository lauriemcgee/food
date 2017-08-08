class AddTaxAndTotalToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_foods, :tax, :decimal, precision: 5, scale: 2
    add_column :carted_foods, :total, :decimal, precision: 5, scale: 2
  end
end
