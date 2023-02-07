module Pages
  module Users
    class Edit < ApplicationPrism
      set_url '/users/edit'

      section :email_form, 'body' do
        element :email, '#user_email'
        element :save_button, '#change_email'
      end

      section :password_form, 'body' do
        element :current_password, '#user_current_password'
        element :password_new, '#user_password'
        element :password_confirmation, '#user_password_confirmation'
        element :save_button, '#change_password'
      end

      section :delete_account_form, 'body' do
        element :check_box, '.checkbox-icon'
        element :button_delete, '#btn_delete'
      end

      def fill_password_form(user, invalid: false)
        user.password = 'test' if invalid
        password_form.current_password.set(user.password)
        password_form.password_new.set('Testtest1')
        password_form.password_confirmation.set('Testtest1')
      end
    end
  end
end
