class Factory
  require 'factory_bot'

  include FactoryBot::Syntax::Methods
end

Category.destroy_all
PizzaDimension.destroy_all
Pizza.destroy_all

CATEGORY_PIZZA = %i[Vegan Hot Meat].freeze
PIZZA_DIMENSIONS = [30, 60, 90, 100].freeze

categories = CATEGORY_PIZZA.map { |category| Category.create(name: category) }
dimensions = PIZZA_DIMENSIONS.map { |dimension| PizzaDimension.create(dimension: dimension) }

13.times { Factory.new.create(:pizza, category: categories.sample, pizza_dimension: dimensions.sample) }
