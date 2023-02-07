module Pages
  module Addresses
    class Edit < SitePrism::Page
      set_url '/address/edit'

      element :success_flash, '.alert-success'
      element :danger_flash, '.alert-danger'

      section :billing_form, 'body' do
        element :button, '#button_billing'
        element :country_select, '#billing_country'
      end

      def fill_form(params, invalid: false)
        params[:phone] = '333-333-333-333' if invalid
        fill_country_select(params.delete(:country))
        params.delete(:type)
        params.each do |key, value|
          fill_in("billing_#{key}", with: value)
        end
      end

      def fill_country_select(country_code)
        billing_form.country_select.find("option[value=#{country_code}]").click
      end
    end
  end
end
