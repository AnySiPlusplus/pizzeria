FactoryBot.define do
  factory :pizza_dimension do
    dimension { rand(30.00...100.00).ceil(2) }
    price { rand(10..100) }
  end
end
