# frozen_string_literal: true

module Checkouts
  class CreateShippingAddress < BaseInteractor
    def call
      setup_form

      update_order if context.params[:checkouts_address]
    end

    private

    def update_order
      context.shipping_form.validate(permit_params) ? context.shipping_form.save : context.fail!
    end

    def setup_form
      context.shipping_form = Checkouts::AddressForm.new(current_form)
    end

    def current_form
      context.current_order.shipping_address || context.current_order.build_shipping_address
    end

    def permit_params
      context.params.require(:checkouts_address).permit(:receiver_name, :street, :building, :city, :phone)
    end
  end
end
