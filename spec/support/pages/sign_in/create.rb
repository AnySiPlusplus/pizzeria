module Pages
  module SignIn
    class Create < ApplicationPrism
      set_url '/users/sign_in'

      section :sign_in_form, 'body' do
        element :email_field, '#user_email'
        element :password_field, '#user_password'
        element :password_has_error, '.has-error'
        element :email_has_error, '.has-error'
      end

      def button_log_in
        first('.log_in')
      end

      def button_my_account
        first('.my_account')
      end

      def button_github
        first('.button_github')
      end

      def button_log_out
        first('.button_log_out')
      end
    end
  end
end
