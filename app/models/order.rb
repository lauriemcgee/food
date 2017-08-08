class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :food_item, optional: true
  has_many :carted_foods
  has_many :food_items, through: :carted_foods

  def calculate_totals
    subtotal = 0
    carted_foods.each do |carted_food|
      subtotal += carted_food.quantity * carted_food.food_item.price
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    tip = 0
    update(subtotal: subtotal, tax: tax, total: total, tip_amount: tip)
  end

end
