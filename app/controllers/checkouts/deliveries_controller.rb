# frozen_string_literal: true

module Checkouts
  class DeliveriesController < BasesController
    ALLOW_STATUSES = %i[address delivery payment confirm].freeze
    def show
      @deliveries = Delivery.all.order(price_cents: :asc)
    end

    def update
      result = Checkouts::UpdateOrderDelivery.call(params:, current_order:)
      result.success? ? success_outcome : bad_outcome
    end

    private

    def success_outcome
      flash[:notice] = I18n.t('notice.delivery_selected')
      redirect_to checkouts_address_path
    end

    def bad_outcome
      flash[:alert] = I18n.t('errors.alert.need_choose')
      redirect_to checkouts_delivery_path
    end
  end
end
