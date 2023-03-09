module Pages
  module ActiveAdmin
    module Pizza
      class Create < SitePrism::Page
        set_url '/admin/pizzas/new'

        section :form, 'body' do
          element :button, '#pizza_submit_action'
          element :category_select, '#pizza_category_id'
          element :pizza_dimension_select, '#pizza_pizza_dimension_id'
          element :add_picture, '.button.has_many_add'
          element :add_filling, '#pizza_filling_ids'
        end

        element :admin_wrong_message, '.inline-errors'

        def fill_form(params, invalid: false)
          choose_category(params.delete(:category))
          choose_pizza_dimension(params.delete(:pizza_dimension))
          choose_filling(params.delete(:fillings))
          params.delete(:name) if invalid
          params.each do |key, value|
            fill_in("pizza_#{key}", with: value)
          end
        end

        def choose_category(category)
          form.category_select.click
          find(:option, text: category.name).click
        end

        def choose_filling(_fillings)
          form.add_filling.click
        end

        def choose_pizza_dimension(pizza_dimension)
          form.pizza_dimension_select.click
          find(:option, text: pizza_dimension.dimension).click
        end

        def add_picture
          form.add_picture.click
          attach_file(Rails.root.join('app/assets/images/small.png'))
        end
      end
    end
  end
end
