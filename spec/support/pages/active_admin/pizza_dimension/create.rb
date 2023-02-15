module Pages
  module ActiveAdmin
    module PizzaDimension
      class Create < SitePrism::Page
        set_url '/admin/pizza_dimensions/new'

        section :form, 'body' do
          element :button, '#pizza_dimension_submit_action'
        end

        element :admin_wrong_message, '.inline-errors'

        def fill_form(params, invalid: false)
          params.delete(:dimension) if invalid
          params.each do |key, value|
            fill_in("pizza_dimension_#{key}", with: value)
          end
        end
      end
    end
  end
end
