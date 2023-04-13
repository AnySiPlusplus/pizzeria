FactoryBot.define do
  factory :filling do
    name { FFaker::Food.ingredient }
    price_cents { rand(100..1000) }
    type { :OrdinaryFilling }
  end
end
