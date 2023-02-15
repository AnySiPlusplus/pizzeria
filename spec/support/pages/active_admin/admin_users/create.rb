module Pages
  module ActiveAdmin
    module AdminUsers
      class Create < SitePrism::Page
        set_url '/admin/admin_users/new'

        element :create_admin_user, '#admin_user_submit_action'

        element :admin_wrong_message, '.inline-errors'

        def fill_form(params, invalid: false)
          params.delete(:email) if invalid
          params.each do |key, value|
            fill_in("admin_user_#{key}", with: value)
          end
        end
      end
    end
  end
end
