class Delivery < ApplicationRecord
  monetize :price_cents

  has_many :orders, dependent: :destroy

  validates :name, presence: true
end
