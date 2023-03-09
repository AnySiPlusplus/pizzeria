class OrderItem < ApplicationRecord
  monetize :price_cents

  belongs_to :pizza
  belongs_to :order
end
