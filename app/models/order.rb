class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :pizzas, through: :order_items

  belongs_to :user, optional: true
end
