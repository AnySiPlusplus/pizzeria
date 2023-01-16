class Pizza < ApplicationRecord
  monetize :price_cents

  belongs_to :category
  belongs_to :pizza_dimension
end
