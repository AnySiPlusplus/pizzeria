module Addresses
  class AddressForm < BaseForm
    NAME = /\A\w[a-z\W]+\z/i
    ADDRESS = /\A[a-z|0-9\W]+\z/i

    NAME_MAXIMUM_LENGTH = 50
    PHONE_MAXIMUM_LENGTH = 15

    property :first_name
    property :last_name
    property :address
    property :city
    property :country
    property :phone
    property :type

    validates :first_name, :last_name, :country, :city, presence: true, length: { maximum: NAME_MAXIMUM_LENGTH }
    validates :first_name, :last_name, :country, :city,
              format: { with: NAME, message: I18n.t('errors.addresses.invalid.fields') }

    validates :address, presence: true, length: { maximum: NAME_MAXIMUM_LENGTH },
                        format: { with: ADDRESS, message: I18n.t('errors.addresses.invalid.address') }
    validates :phone, presence: true, phone: { message: I18n.t('errors.addresses.invalid.phone') },
                      length: { maximum: PHONE_MAXIMUM_LENGTH }
  end
end
