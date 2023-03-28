class Order < ApplicationRecord
  CHECKOUT_STATUSES = { delivery: 0, address: 1, payment: 2, confirm: 3 }.freeze
  FINISHED_STATUSES = { complete: 4, in_progress: 5, in_delivery: 6, delivered: 7, canceled: 8 }.freeze

  monetize :subtotal_cents

  has_many :order_items, dependent: :destroy
  has_many :pizzas, through: :order_items

  belongs_to :user, optional: true
  belongs_to :delivery, optional: true

  accepts_nested_attributes_for :order_items, allow_destroy: true

  enum :status, { **CHECKOUT_STATUSES, **FINISHED_STATUSES }, default: :delivery
end
