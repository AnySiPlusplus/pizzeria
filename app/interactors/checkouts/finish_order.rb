module Checkouts
  class FinishOrder < BaseInteractor
    def call
      context.current_order.update(order_params_update)
      update_total_price_order_items
      context.current_order.complete!
    end

    private

    def update_total_price_order_items
      context.current_order.order_items.each do |order_item|
        order_item.update(price_cents: order_item.pizza.price_cents)
      end
    end

    def order_params_update
      { subtotal_cents: context.current_order.amount_pay.cents,
        completed_at: Time.zone.now }
    end
  end
end
