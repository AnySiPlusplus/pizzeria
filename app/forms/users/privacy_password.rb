module Users
  class PrivacyPassword < BaseForm
    PASSWORD_REGEX = /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,30}\z/
    MINIMUM_PASSWORD_LENGTH = 8
    MAXIMUM_PASSWORD_LENGTH = 30

    property :email, readonly: true
    property :password
    property :password_confirmation
    property :current_password

    validates :password, confirmation: true, presence: true,
                         length: { minimum: MINIMUM_PASSWORD_LENGTH, maximum: MAXIMUM_PASSWORD_LENGTH },
                         format: { with: PASSWORD_REGEX, message: I18n.t('errors.users.invalid.password') }
    validates :current_password, presence: true
    validate :current_password_valid

    private

    def current_password_valid
      return if model.valid_password?(current_password)

      errors.add(:current_password, :invalid)
    end
  end
end
