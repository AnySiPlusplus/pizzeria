FactoryBot.define do
  factory :pizza do
    name { FFaker::Address.city }
    price_cents { rand(5000..10_000) }
    description { Rails.env.test? ? FFaker::Lorem.characters(400) : FFaker::Book.description(5) }
    category { create(:category) }
    pizza_dimension { create(:pizza_dimension) }
    fillings { create_list(:filling, 7).sample(4) }
    type { :ordinaryPizza }
  end
end
