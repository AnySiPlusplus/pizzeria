FactoryBot.define do
  factory :pizza do
    name { FFaker::Address.city }
    price_cents { rand(10..100) }
    description { Rails.env.test? ? FFaker::Lorem.characters(400) : FFaker::Book.description(5) }
    category { create(:category) }
    pizza_dimension { create(:pizza_dimension) }
    fillings { create_list(:filling, 3) }
  end
end
