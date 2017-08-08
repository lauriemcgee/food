class FoodItem < ApplicationRecord
  has_many :carted_foods
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

  def discounted?
    return price < 10
  end
end
