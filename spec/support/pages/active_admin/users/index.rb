module Pages
  module ActiveAdmin
    module Users
      class Index < SitePrism::Page
        set_url '/admin/users'

        element :admin_success_flash, '.flash.flash_notice'

        element :create_button, '.action_item'

        section :links, 'body' do
          element :view, '.view_link'
          element :delete, '.delete_link'
        end
      end
    end
  end
end
