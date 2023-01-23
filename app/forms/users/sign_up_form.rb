module Users
  class SignUpForm < BaseForm
    MAXIMUM_EMAIL_LENGTH = 63
    MINIMUM_PASSWORD_LENGTH = 8
    MAXIMUM_PASSWORD_LENGTH = 30
    EMAIL_REGEX = /\A(\w\.?'?)+@[a-z-]+(\.[a-z]+)*\.[a-z]+\z/
    PASSWORD_REGEX = /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,30}\z/

    property :email
    property :password_confirmation
    property :password

    validates_uniqueness_of :email
    validates :email, presence: true, length: { maximum: MAXIMUM_EMAIL_LENGTH }, format: { with: EMAIL_REGEX }
    validates :password, confirmation: true, presence: true,
                         length: { minimum: MINIMUM_PASSWORD_LENGTH, maximum: MAXIMUM_PASSWORD_LENGTH },
                         format: { with: PASSWORD_REGEX, message: I18n.t('errors.user.invalid.password') }
  end
end
