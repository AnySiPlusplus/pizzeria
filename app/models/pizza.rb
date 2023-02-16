class Pizza < ApplicationRecord
  monetize :price_cents

  belongs_to :category
  belongs_to :pizza_dimension

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
end
