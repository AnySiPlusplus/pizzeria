FILLING = %w[pineapple sausage mushrooms cheese].freeze

FactoryBot.define do
  factory :pizza do
    name { FFaker::Address.city }
    price_cents { rand(10..100) }
    description { Rails.env.test? ? FFaker::Lorem.characters(400) : FFaker::Book.description(5) }
    filling { FILLING.sample }
    category { create(:category) }
    pizza_dimension { create(:pizza_dimension) }
  end
end
