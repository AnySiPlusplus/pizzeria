class ApplicationPrism < SitePrism::Page
  element :success_flash, '.alert-success'
  element :danger_flash, '.alert-danger'
  element :error_flash, '.alert-warning'

  section :status_links, 'body' do
    element :address, 'a', text: I18n.t('checkouts.addresses.order_status.address')
    element :delivery, 'a', text: I18n.t('checkouts.addresses.order_status.delivery')
    element :payment, 'a', text: I18n.t('checkouts.addresses.order_status.payment')
    element :confirm, 'a', text: I18n.t('checkouts.addresses.order_status.confirm')
  end

  def setup_addresses_to_order(address)
    current_order.build_billing.update(address)
    current_order.build_shipping.update(address)
  end

  def setup_delivery_to_order(delivery)
    current_order.update(delivery_id: delivery.id)
  end

  def setup_card_to_order(attributes_card)
    current_order.build_card.update(attributes_card)
  end
end
