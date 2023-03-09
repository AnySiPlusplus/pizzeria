FactoryBot.define do
  factory :pizza_filling do
    pizza { create(:pizza) }
    filling { create(:filling) }
  end
end
