# frozen_string_literal: true

module Pizzas
  class CreateCustomPizza < BaseInteractor
    EXCEPT_PARAMS = %w[id created_at updated_at type].freeze
    def call
      return check_include_filling if current_pizza.type.eql?('CustomPizza')

      custom_pizza_form.save ? good_outcome : context.fail!
    end

    private

    def good_outcome
      current_order_item.update(pizza: custom_pizza_form)
      custom_pizza_form.fillings = current_pizza.fillings
      custom_pizza_form.fillings.delete(except_filling)
    end

    def check_include_filling
      current_pizza.fillings.include?(except_filling) ? delete_filling : update_pizza_filling
    end

    def delete_filling
      current_pizza.fillings.delete(except_filling)
    end

    def update_pizza_filling
      current_pizza.fillings << except_filling
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
