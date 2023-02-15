module Pages
  module ActiveAdmin
    module Categories
      class Create < SitePrism::Page
        set_url '/admin/categories/new'

        section :form, 'body' do
          element :button, '#category_submit_action'
        end

        element :admin_wrong_message, '.inline-errors'

        def fill_form(params, invalid: false)
          params.delete(:name) if invalid
          params.each do |key, value|
            fill_in("category_#{key}", with: value)
          end
        end
      end
    end
  end
end
