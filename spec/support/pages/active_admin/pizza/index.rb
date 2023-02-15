module Pages
  module ActiveAdmin
    module Pizza
      class Index < SitePrism::Page
        set_url '/admin/pizzas'

        element :create_button, '.action_item'

        section :links, 'body' do
          element :view, '.view_link'
          element :edit, '.edit_link'
          element :delete, '.delete_link'
        end

        element :admin_success_flash, '.flash.flash_notice'
      end
    end
  end
end
