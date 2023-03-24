class Factory
  require 'factory_bot'

  include FactoryBot::Syntax::Methods
end

Category.destroy_all
PizzaDimension.destroy_all
Pizza.destroy_all
Filling.destroy_all
AdminUser.destroy_all

CATEGORY_PIZZA = %i[Vegan Hot Meat].freeze
PIZZA_DIMENSIONS = [30, 60, 90, 100].freeze
ADDITIONAL_FILLINGS = %i[cheese meat paper].freeze

categories = CATEGORY_PIZZA.map { |category| Category.create(name: category) }

dimensions = PIZZA_DIMENSIONS.map do |dimension|
  Factory.new.create(:pizza_dimension, dimension: dimension)
end

fillings = Factory.new.create_list(:filling, 8)

ADDITIONAL_FILLINGS.each { |filling| Factory.new.create(:filling, name: filling, type: :AdditionalFilling) }

13.times do
  Factory.new.create(:ordinary_pizza, category: categories.sample, pizza_dimension: dimensions.sample,
                                      fillings: fillings.sample(rand(3..6)))
end

AdminUser.create!(email: Rails.application.credentials.dig(:admin, :user_name),
                  password: Rails.application.credentials.dig(:admin, :password),
                  password_confirmation: Rails.application.credentials.dig(:admin, :password))
