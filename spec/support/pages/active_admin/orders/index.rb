module Pages
  module ActiveAdmin
    module Orders
      class Index < SitePrism::Page
        set_url '/admin/orders'

        section :links, 'body' do
          element :view, '.view_link'
          element :edit, '.edit_link'
          element :delete, '.delete_link'
        end

        element :admin_success_flash, '.flash.flash_notice'

        def current_order
          @current_order ||= Order.find_by(status: :complete)
        end

        def setup_addresses_to_order(address)
          current_order.build_shipping_address.update(address)
        end

        def setup_delivery_to_order(delivery)
          current_order.update(delivery_id: delivery.id)
        end

        def setup_card_to_order(attributes_card)
          current_order.build_card.update(attributes_card)
        end
      end
    end
  end
end
