MoneyRails.configure do |config|
  config.default_currency = :usd
  config.locale_backend = :i18n
end
Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
