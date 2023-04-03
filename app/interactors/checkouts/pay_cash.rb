module Checkouts
  class PayCash < BaseInteractor
    def call
      update_order_status if use_cash?
    end

    private

    def update_order_status
      context.current_order.card.delete
      context.current_order.confirm!
    end

    def use_cash?
      context.params[:pay_cash][:cash].to_i == 1
    end
  end
end
