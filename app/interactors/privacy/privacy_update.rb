module Privacy
  class PrivacyUpdate < BaseInteractor
    def call
      context.form = email_presence ? build_form(Users::PrivacyEmail) : build_form(Users::PrivacyPassword)

      return context.fail! unless context.form.validate(context.params)

      email_presence ? without_password : with_password
    end

    private

    def email_presence
      !context.params[:email].nil?
    end

    def build_form(form_klass)
      form_klass.new(context.resource)
    end

    def with_password
      context.resource.update_with_password(context.params)
    end

    def without_password
      context.resource.update_without_password(context.params)
    end
  end
end
