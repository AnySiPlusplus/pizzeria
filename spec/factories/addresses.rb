FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country_code }
    phone { FFaker.numerify('+1352-2##-####') }
    type { %w[Billing Shipping].sample }
  end
end
