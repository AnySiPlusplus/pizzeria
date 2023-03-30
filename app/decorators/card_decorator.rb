class CardDecorator < ApplicationDecorator
  LAST_NUMBERS_CARD = 4
  MASKED_SYMBOLS = '**** **** ****'.freeze
  delegate_all

  def masked_card_number
    "#{MASKED_SYMBOLS} #{card_number.last(LAST_NUMBERS_CARD)}"
  end

  delegate :card_number, to: :object
end
