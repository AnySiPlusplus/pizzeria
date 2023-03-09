class Filling < ApplicationRecord
  monetize :price_cents

  has_many :pizza_fillings, dependent: :destroy
  has_many :pizzas, through: :pizza_fillings
end
