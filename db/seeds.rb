class Factory
  require 'factory_bot'

  include FactoryBot::Syntax::Methods
end

Category.destroy_all
PizzaDimension.destroy_all
Pizza.destroy_all
AdminUser.destroy_all

CATEGORY_PIZZA = %i[Vegan Hot Meat].freeze
PIZZA_DIMENSIONS = [30, 60, 90, 100].freeze
DIMENSION = [].freeze

categories = CATEGORY_PIZZA.map { |category| Category.create(name: category) }
PIZZA_DIMENSIONS.each do |dimension|
  DIMENSION << Factory.new.create(:pizza_dimension, dimension: dimension)
end

13.times { Factory.new.create(:pizza, category: categories.sample, pizza_dimension: DIMENSION.sample) }

AdminUser.create!(email: Rails.application.credentials.dig(:admin, :user_name),
                  password: Rails.application.credentials.dig(:admin, :password),
                  password_confirmation: Rails.application.credentials.dig(:admin, :password))
