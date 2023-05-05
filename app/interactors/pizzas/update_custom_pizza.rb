module Pizzas
  class UpdateCustomPizza < BaseInteractor
    EXCEPT_PARAMS = %w[id created_at updated_at type].freeze
    CUSTOM_PIZZA = 'CustomPizza'.freeze

    def call
      return working_with_custom_pizza if current_pizza.type.eql?(CUSTOM_PIZZA)

      custom_pizza_form.save ? good_outcome : context.fail!
    end

    private

    def good_outcome
      current_order_item.update(pizza: custom_pizza_form)
      custom_pizza_form.fillings = current_pizza.fillings
      custom_pizza_form.fillings.delete(except_filling) unless params_filling_id_zero?
      working_with_custom_pizza(custom_pizza_form)
    end

    def working_with_custom_pizza(object = current_pizza)
      check_include_filling(object)
      update_pizza_dimension(object)
    end

    def check_include_filling(object)
      return if params_filling_id_zero?

      object.fillings.include?(except_filling) ? delete_filling(object) : update_pizza_filling(object)
    end

    def delete_filling(object)
      object.fillings.delete(except_filling)
    end

    def update_pizza_filling(object)
      object.fillings << except_filling
    end

    def update_pizza_dimension(object)
      return if object.pizza_dimension == current_pizza_dimension

      object.update(pizza_dimension: current_pizza_dimension)
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

    def current_pizza_dimension
      @current_pizza_dimension ||= PizzaDimension.find_by(dimension: context.params[:pizza_dimension])
    end

    def except_filling
      Filling.find(context.params[:filling_id])
    end

    def params
      @params ||= current_pizza.attributes.except(*EXCEPT_PARAMS)
    end

    def params_filling_id_zero?
      context.params[:filling_id].to_i.zero?
    end
  end
end
