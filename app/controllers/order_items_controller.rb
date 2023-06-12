class OrderItemsController < ApplicationController
  MESSAGES = {
    success: { notice: I18n.t('notice.pizza_update') },
    fail: { alert: I18n.t('errors.alert.wrong_book_quantity') }
  }.freeze

  def create
    result = OrderItems::ItemsCreate.call(params:, current_order:)
    result_message(result)
    redirect_to pizzas_path
  end

  def destroy
    current_order.order_items.find(params[:id]).destroy
  end

  def update
    OrderItems::ItemsUpdate.call(params:, current_order:)
  end
end
