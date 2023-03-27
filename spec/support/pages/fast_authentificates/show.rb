module Pages
  module FastAuthentificates
    class Show < ApplicationPrism
      set_url '/fast_authentificate'

      element :button_log_in, '.btn.btn.btn-default.mb-20.log_in'
      element :button_continue_checkout, '#continue_checkout'

      element :output_message_about_error, 'span.help-block'

      def fill_form_with_password(params)
        params.each do |key, value|
          fill_in "user_#{key}",	with: value
        end
      end

      def quick_register(params)
        fill_in 'users_privacy_email_email', with: params
      end
    end
  end
end
