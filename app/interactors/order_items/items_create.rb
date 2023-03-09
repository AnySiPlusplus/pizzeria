module OrderItems
  class ItemsCreate < BaseInteractor
    def call
      return update! if checking_presence_pizza

      context.current_order.order_items.create(permit_params)
    end

    private

    def permit_params
      @permit_params ||= context.params.require(:order_item).permit(:pizza_id, :quantity)
    end

    def update!
      ItemsUpdate.call(params: context.params, current_order: context.current_order)
    end

    def checking_presence_pizza
      context.current_order.order_items.exists?(pizza_id: permit_params[:pizza_id].to_i)
    end
  end
end
