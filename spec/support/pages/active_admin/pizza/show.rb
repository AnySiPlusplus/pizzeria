module Pages
  module ActiveAdmin
    module Pizza
      class Show < Index
        set_url '/admin/pizzas/{id}'
      end
    end
  end
end
