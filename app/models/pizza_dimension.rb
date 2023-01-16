class PizzaDimension < ApplicationRecord
  monetize :price_cents

  has_many :pizzas, dependent: :destroy
end
