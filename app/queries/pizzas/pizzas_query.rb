module Pizzas
  class PizzasQuery < BaseQuery
    ORDERS = {
      'name_asc' => { name: :asc },
      'name_desc' => { name: :desc },
      'newest' => { created_at: :desc },
      'most_popular' => { created_at: :desc },
      'price_asc' => { price_cents: :asc },
      'price_desc' => { price_cents: :desc }
    }.freeze

    def initialize(params)
      super
      @params[:sort_by] ||= 'name_asc'
      @scope = Pizza.all
    end

    def call
      by_category if params[:category_id].present?
      by_order if params[:sort_by].present?
      @scope
    end

    def by_category
      return @scope unless Category.find_by(id: params[:category_id])

      @scope = Pizza.where(category_id: params[:category_id])
    end

    def by_order
      return @params[:sort_by] = 'name_asc' unless ORDERS.include?(params[:sort_by])

      @scope = @scope.order(ORDERS[params[:sort_by]])
    end
  end
end
