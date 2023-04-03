module Checkouts
  class AddressForm < BaseForm
    NAME = /\A\w[a-z\W]+\z/i
    STREET = /\A[a-z|0-9\W]+\z/i

    NAME_MAXIMUM_LENGTH = 50
    PHONE_MAXIMUM_LENGTH = 15

    property :receiver_name
    property :street
    property :building
    property :city
    property :phone

    validates :receiver_name, :city, :building, presence: true, length: { maximum: NAME_MAXIMUM_LENGTH }
    validates :receiver_name, :city,
              format: { with: NAME, message: I18n.t('errors.addresses.invalid.fields') }

    validates :street, presence: true, length: { maximum: NAME_MAXIMUM_LENGTH },
                       format: { with: STREET, message: I18n.t('errors.addresses.invalid.address') }
    validates :phone, presence: true, phone: { message: I18n.t('errors.addresses.invalid.phone') },
                      length: { maximum: PHONE_MAXIMUM_LENGTH }
  end
end
