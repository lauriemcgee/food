class CartedFood < ApplicationRecord
  belongs_to :user
  belongs_to :food_item
  belongs_to :order, optional: true

end
