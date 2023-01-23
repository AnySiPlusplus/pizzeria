module Pages
  module SignUp
    class Create < ApplicationPrism
      set_url '/users/sign_up'

      section :sign_up_form, 'body' do
        element :email_field, '#user_email'
        element :password_field, '#user_password'
        element :confirm_password, '#user_password_confirmation'
        element :password_has_error, '.has-error'
      end

      def success_message
        I18n.t('devise.registrations.signed_up_but_unconfirmed')
      end

      def button_sign_up
        first('.registrate')
      end
    end
  end
end
