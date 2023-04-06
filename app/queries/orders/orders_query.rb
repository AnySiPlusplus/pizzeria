module Orders
  class OrdersQuery < BaseQuery
    def initialize(params, current_user = nil)
      super
      @scope = Order.where(status: Order::FINISHED_STATUSES.keys, user_id: @current_user.id).order(completed_at: :desc)
    end

    def call
      params[:status] ? @scope.where(status: params[:status]) : @scope
    end
  end
end
