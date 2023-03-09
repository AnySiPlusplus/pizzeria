FactoryBot.define do
  factory :filling do
    name { FFaker::Food.ingredient }
    price_cents { rand(10..100) }
  end
end
