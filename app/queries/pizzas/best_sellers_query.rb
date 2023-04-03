module Pizzas
  class BestSellersQuery < BaseQuery
    SUM_QUANTITY = 'sum(order_items.quantity) desc'.freeze
    BEST_SELLERS_COUNT = 4

    def initialize(params)
      super
      @scope = Pizza.where(type: :OrdinaryPizza).includes(:pizza_pictures)
    end

    def call
      @scope = best_sellers.decorate.first(BEST_SELLERS_COUNT)
    end

    private

    def best_sellers
      @scope.joins(:orders).where(orders: { status: Order::FINISHED_STATUSES.keys }).group(:id).order(SUM_QUANTITY)
    end
  end
end
