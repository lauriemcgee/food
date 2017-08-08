class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :description
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
