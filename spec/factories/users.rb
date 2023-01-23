FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    password_confirmation { password }
    confirmed_at { Time.zone.now }
  end
end
