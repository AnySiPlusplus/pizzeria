FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    review_text { FFaker::Book.description }
    rating { rand(1..5) }
    pizza { create(:ordinary_pizza) }
    user { create(:user) }
  end
end
