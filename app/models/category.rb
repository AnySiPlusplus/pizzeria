class Category < ApplicationRecord
  has_many :pizzas, dependent: :destroy
end
