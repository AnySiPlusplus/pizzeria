FactoryBot.define do
  factory :shipping_address do
    order { create(:order) }
    receiver_name { FFaker::Name.first_name }
    street { FFaker::AddressBR.street }
    building { FFaker::AddressBR.building_number }
    city { FFaker::AddressBR.city }
  end
end
