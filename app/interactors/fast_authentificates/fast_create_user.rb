module FastAuthentificates
  class FastCreateUser < BaseInteractor
    def call
      create_form.validate(email: permit_params[:email].downcase) ? save_user : bad_outcome
    end

    private

    def save_user
      user.skip_confirmation!
      user.save
      context.user = user
    end

    def bad_outcome
      context.form = create_form
      context.fail!
    end

    def user
      @user ||= User.new(
        email: context.params[:users_privacy_email][:email],
        password: Devise.friendly_token.first(Devise.password_length.first)
      )
    end

    def create_form
      @create_form ||= Users::PrivacyEmail.new(User.new)
    end

    def permit_params
      context.params.require(:users_privacy_email).permit(:email)
    end
  end
end
