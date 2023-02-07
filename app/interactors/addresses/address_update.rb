module Addresses
  class AddressUpdate < BaseInteractor
    def call
      setup_forms
      validate_form if context.params[:shipping] || context.params[:billing]
    end

    private

    def validate_form
      current_form.validate(address_params) ? current_form.save : context.fail!
      context.address_type = address_params[:type]
    end

    def setup_forms
      context.billing_form = Addresses::AddressForm.new(billing_form)
      context.shipping_form = Addresses::AddressForm.new(shipping_form)
    end

    def current_form
      address_params[:type] == I18n.t('addresses.address.billing') ? context.billing_form : context.shipping_form
    end

    def address_params
      current_params = context.params[:billing].nil? ? :shipping : :billing
      context.params.require(current_params).permit(:first_name, :last_name, :address, :city,
                                                    :zip, :country, :phone, :type)
    end

    def billing_form
      context.current_user.billing || context.current_user.build_billing
    end

    def shipping_form
      context.current_user.shipping || context.current_user.build_shipping
    end
  end
end
