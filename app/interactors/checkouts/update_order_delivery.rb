module Checkouts
  class UpdateOrderDelivery < BaseInteractor
    def call
      return context.fail! unless context.params[:delivery]

      context.current_order.update(delivery: current_delivery)
      context.current_order.payment!
    end

    private

    def current_delivery
      Delivery.find(context.params[:delivery][:id])
    end
  end
end
