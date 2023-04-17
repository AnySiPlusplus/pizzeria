class Pizza < ApplicationRecord
  monetize :price_cents

  belongs_to :category
  belongs_to :pizza_dimension

  has_many :reviews, dependent: :destroy
  has_many :pizza_pictures, as: :picturable, dependent: :destroy

  has_many :pizza_fillings, dependent: :destroy
  has_many :fillings, through: :pizza_fillings

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  accepts_nested_attributes_for :pizza_pictures, allow_destroy: true

  validates :name, presence: true
end
