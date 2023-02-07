module Users
  class PrivacyEmail < BaseForm
    MAXIMUM_EMAIL_LENGTH = 63
    EMAIL_REGEX = /\A(\w\.?'?)+@[a-z-]+(\.[a-z]+)*\.[a-z]+\z/

    property :email

    validates :email, presence: true, length: { maximum: MAXIMUM_EMAIL_LENGTH },
                      format: { with: EMAIL_REGEX, message: I18n.t('errors.users.invalid.email') }
  end
end
