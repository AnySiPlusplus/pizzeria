module CheckoutsHelper
  ACTIVE_STATUS = 'active'.freeze

  def current_status(path)
    ACTIVE_STATUS if response.request.path == path
  end

  def shipping_address_present?
    current_order.shipping_address.present?
  end
end
