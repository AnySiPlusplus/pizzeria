module Checkouts
  class CardForm < BaseForm
    CARD_NUMBER_REGEXP = /\A[-0-9]+\z/
    CARD_NAME_REGEXP = /\A\w[a-z\W]+\z/i
    CARD_VALIDITY_REGEXP = %r{\A(0[1-9]|1[0-2])/(1[7-9]|[0-9]\d)\z}
    MINIMUM_CARD_NUMBER = 16
    MAXIMUM_CARD_NAME = 50
    MINIMUM_CVV = 3
    MAXIMUM_CVV = 4

    property :card_number
    property :card_name
    property :validity
    property :cvv

    validates :card_number, :card_name, :validity, :cvv, presence: true
    validates :card_number, length: { minimum: MINIMUM_CARD_NUMBER, maximum: MINIMUM_CARD_NUMBER },
                            format: { with: CARD_NUMBER_REGEXP, message: I18n.t('card_form.errors.wrong_number') }
    validates :card_name, length: { maximum: MAXIMUM_CARD_NAME },
                          format: { with: CARD_NAME_REGEXP, message: I18n.t('card_form.errors.wrong_name') }
    validates :validity,
              format: { with: CARD_VALIDITY_REGEXP,
                        message: I18n.t('card_form.errors.wrong_validity') }
    validates :cvv, length: { minimum: MINIMUM_CVV, maximum: MAXIMUM_CVV }
  end
end
