FactoryBot.define do
  factory :delivery do
    name { FFaker::Company.name }
    time { "up to #{rand(20..50)} minutes" }
    price_cents { rand(1000...4000) }
  end
end
