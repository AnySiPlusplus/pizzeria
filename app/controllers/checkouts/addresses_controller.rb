# frozen_string_literal: true

module Checkouts
  class AddressesController < BasesController
    ALLOW_STATUSES = %i[address payment confirm].freeze

    before_action :check_delivery_method, :setup_forms

    def update
      result.success? ? good_outcome : render(:show)
    end

    private

    def good_outcome
      flash[:notice] = 'Address was Updated'
      redirect_to(checkouts_payment_path)
    end

    def setup_forms
      @shipping_form = result.shipping_form
    end

    def result
      @result ||= Checkouts::CreateShippingAddress.call(params: params, current_order: current_order)
    end

    def check_delivery_method
      redirect_to(checkouts_payment_path) if current_order.delivery.name == 'Take away'
    end
  end
end
