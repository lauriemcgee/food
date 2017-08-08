class User < ApplicationRecord
  has_secure_password
  has_many :carted_foods
  has_many :orders
end
