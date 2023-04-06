module Pages
  module ActiveAdmin
    module Orders
      class Show < Index
        set_url '/admin/orders/{id}'

        element :button_edit, '.action_item'
      end
    end
  end
end
