module Pizzas
  class PizzasQuery < BaseQuery
    DEFAULT_HOME_SORT = 'newest_asc'.freeze
    DEFAULT_BOOKS_SORT = 'name_asc'.freeze
    HOMES_CONTROLLER = 'homes'.freeze
    JOINS_ORDER_ITEMS_TO_ORDER = "left join orders ON order_items.order_id = orders.id
            AND orders.status IN (#{Order::FINISHED_STATUSES.values.join(',')})".freeze

    def initialize(params)
      super
      @params[:sort_by] ||= params[:controller].eql?(HOMES_CONTROLLER) ? DEFAULT_HOME_SORT : DEFAULT_BOOKS_SORT
      @scope = Pizza.where(type: :OrdinaryPizza).includes(:pizza_pictures)
    end

    ORDERS = {
      'name_asc' => { name: :asc },
      'name_desc' => { name: :desc },
      'newest' => { created_at: :desc },
      'most_popular' => { created_at: :desc },
      'price_asc' => { price_cents: :asc },
      'price_desc' => { price_cents: :desc }
    }.freeze

    def call
      by_category if params[:category_id].present?
      by_order if params[:sort_by].present?
      @scope
    end

    private

    def by_most_popular
      sanitazed_sql = ActiveRecord::Base.sanitize_sql(JOINS_ORDER_ITEMS_TO_ORDER)
      @scope = @scope.left_joins(:order_items).joins(sanitazed_sql).group(:id).order('COUNT(orders) desc')
    end

    def by_order
      return by_most_popular if params[:sort_by]['most_popular']

      @scope = @scope.order(ORDERS[params[:sort_by]])
    end

    def by_category
      @scope = @scope.where(category_id: params[:category_id])
    end
  end
end
