module Pages
  module ActiveAdmin
    module Pizza
      class Create < SitePrism::Page
        set_url '/admin/pizzas/new'

        section :form, 'body' do
          element :button, '#pizza_submit_action'
          element :category_select, '#pizza_category_id'
          element :pizza_dimension_select, '#pizza_pizza_dimension_id'
        end

        element :admin_wrong_message, '.inline-errors'

        def fill_form(params, invalid: false)
          choose_category(params.delete(:category))
          choose_pizza_dimension(params.delete(:pizza_dimension))
          params.delete(:name) if invalid
          params.each do |key, value|
            fill_in("pizza_#{key}", with: value)
          end
        end

        def choose_category(category)
          form.category_select.click
          find(:option, text: category.name).click
        end

        def choose_pizza_dimension(pizza_dimension)
          form.pizza_dimension_select.click
          find(:option, text: pizza_dimension.dimension).click
        end
      end
    end
  end
end
