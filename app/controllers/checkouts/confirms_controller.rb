# frozen_string_literal: true

module Checkouts
  class ConfirmsController < BasesController
    ALLOW_STATUSES = [:confirm].freeze

    def show
      super
      @shipping_address = @order.shipping_address
      @delivery = @order.delivery
      @card = @order.card&.decorate
    end

    def create
      Checkouts::FinishOrder.call(current_order: current_order.decorate)
      redirect_to checkouts_complete_path(order_id: current_order.id)
    end
  end
end
