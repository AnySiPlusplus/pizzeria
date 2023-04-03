FactoryBot.define do
  factory :card do
    card_number { Array.new(16) { rand(1..9) }.join }
    card_name { FFaker::Name.name }
    order { create(:order) }
    validity { FFaker::Bank.card_expiry_date }
    cvv { Array.new(rand(3..4)) { rand(1..9) }.join }
  end
end
