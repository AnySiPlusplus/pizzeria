class OrderItem < ApplicationRecord
  monetize :price_cents

  belongs_to :pizza
  belongs_to :order

  def additional_fillings
    pizza.fillings.where(type: 'AdditionalFilling')
  end
end
