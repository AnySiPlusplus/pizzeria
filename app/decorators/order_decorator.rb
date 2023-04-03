class OrderDecorator < ApplicationDecorator
  ORDER_MAX_COUNT_ZERO = 9
  ZERO = 0

  delegate_all
  decorates_association :order_items
  decorates_association :card
  delegate :masked_card_number, to: :card
  delegate :card_number, to: :card

  STATUS_COLORS = {
    'complete' => 'text-info',
    'in_progress' => 'text-warning',
    'in_delivery' => 'text-primary',
    'delivered' => 'text-success',
    'canceled' => 'text-danger'
  }.freeze

  def order_number
    id.to_s.rjust(ORDER_MAX_COUNT_ZERO, ZERO.to_s)
  end

  def completed_date
    completed_at.strftime(I18n.t('checkouts.date_format'))
  end

  def amount_pay
    sum = order_items.includes(:pizza).sum(&:amount_pay)
    sum += delivery.price if delivery
    sum
  end
end
