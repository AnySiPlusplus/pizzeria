module Pizzas
  class UpdateCustomPizza < BaseInteractor
    EXCEPT_PARAMS = %w[id created_at updated_at type].freeze
    CUSTOM_PIZZA = 'CustomPizza'.freeze

    def call
      return check_include_filling if current_pizza.type.eql?(CUSTOM_PIZZA)

      custom_pizza_form.save ? good_outcome : context.fail!
    end

    private

    def good_outcome
      current_order_item.update(pizza: custom_pizza_form)
      custom_pizza_form.fillings = current_pizza.fillings
      custom_pizza_form.fillings.delete(except_filling)
      check_include_filling(custom_pizza_form)
    end

    def check_include_filling(object = current_pizza)
      object.fillings.include?(except_filling) ? delete_filling(object) : update_pizza_filling(object)
    end

    def delete_filling(object)
      object.fillings.delete(except_filling)
    end

    def update_pizza_filling(object)
      object.fillings << except_filling
    end

    def custom_pizza_form
      @custom_pizza_form ||= CustomPizza.new(params)
    end

    def current_order_item
      @current_order_item ||= OrderItem.find(context.params[:order_item_id])
    end

    def current_pizza
      @current_pizza ||= current_order_item.pizza
    end

    def except_filling
      Filling.find(context.params[:filling_id])
    end

    def params
      @params ||= current_pizza.attributes.except(*EXCEPT_PARAMS)
    end
  end
end
