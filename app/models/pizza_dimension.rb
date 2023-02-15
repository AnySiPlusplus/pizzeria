class PizzaDimension < ApplicationRecord
  monetize :price_cents

  has_many :pizzas, dependent: :destroy

  validates :dimension, presence: true
end
