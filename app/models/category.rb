class Category < ApplicationRecord
  has_many :pizzas, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
