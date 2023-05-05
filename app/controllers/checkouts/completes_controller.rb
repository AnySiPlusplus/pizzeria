module Checkouts
  class CompletesController < BasesController
    ALLOW_STATUSES = [:complete].freeze

    def show
      session.delete(:order_id)
      super
      @shipping_address = current_order.shipping_address
      @card = current_order.card&.decorate
    end

    private

    def current_order
      @current_order ||= current_user.orders.find_by(status: :complete, id: params[:order_id])
    end
  end
end
