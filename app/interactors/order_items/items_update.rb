module OrderItems
  class ItemsUpdate < BaseInteractor
    MINIMUM_PIZZAS_QUANTIY = 1

    def call
      return context.fail! if quantity_less_minimum_count?

      order_item.update(quantity: permit_params[:quantity])
    end

    private

    def quantity_less_minimum_count?
      MINIMUM_PIZZAS_QUANTIY > permit_params[:quantity].to_i
    end

    def order_item
      @order_item ||= context.current_order.order_items.find_by(pizza_id: permit_params[:pizza_id])
    end

    def permit_params
      @permit_params ||= context.params.require(:order_item).permit(:pizza_id, :quantity)
    end
  end
end
