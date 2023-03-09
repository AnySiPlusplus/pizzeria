FactoryBot.define do
  factory :order_item do
    quantity { rand(1..10) }
    pizza { create(:pizza) }
    price_cents { rand(1000...4000) }
    order { create(:order) }
  end
end
