class Factory
  require 'factory_bot'

  include FactoryBot::Syntax::Methods
end

Category.destroy_all
PizzaDimension.destroy_all
Pizza.destroy_all
Filling.destroy_all
AdminUser.destroy_all
Delivery.destroy_all

CATEGORY_PIZZA = %i[Vegan Hot Meat].freeze
PIZZA_DIMENSIONS = [30, 60, 90, 100].freeze
ADDITIONAL_FILLINGS = %i[cheese meat pepper].freeze
DEVIVERY_COMPANIES = %i[FedEx UPS USPS Walmart Amazon].freeze

categories = CATEGORY_PIZZA.map { |category| Category.create(name: category) }
Category.create(name: :Custom)

dimensions = PIZZA_DIMENSIONS.map do |dimension|
  Factory.new.create(:pizza_dimension, dimension: dimension)
end

DEVIVERY_COMPANIES.each do |company_name|
  Delivery.create(name: company_name, time: "up to #{rand(20..50)} minutes", price_cents: rand(1000...8000))
end

Delivery.create(name: 'Take away', time: 'now', price: 0)

fillings = Factory.new.create_list(:filling, 8)

ADDITIONAL_FILLINGS.each { |filling| Factory.new.create(:filling, name: filling, type: :AdditionalFilling) }

15.times do
  Factory.new.create(:ordinary_pizza, category: categories.sample, pizza_dimension: dimensions.sample,
                                      fillings: fillings.sample(rand(3..6)))
end

AdminUser.create!(email: Rails.application.credentials.dig(:admin, :user_name),
                  password: Rails.application.credentials.dig(:admin, :password),
                  password_confirmation: Rails.application.credentials.dig(:admin, :password))
