class HomesController < ApplicationController
  NEWEST_PIZZAS_COUNT = 2

  def index
    @best_sellers = Pizzas::BestSellersQuery.new(params).call
    @newest_pizzas = Pizzas::PizzasQuery.new(params).call.decorate.first(NEWEST_BOOKS_COUNT)
  end
end
