# frozen_string_literal: true

module Pizzas
  class CreateCustomPizza < BaseInteractor
    DEFAULT_PIZZA_PRICE = 1000

    def call
      create_custom_pizza
      create_order_item
    end

    private

    def create_order_item
      context.current_order.order_items.build(pizza_id: current_form.id).save
    end

    def fillings
      Filling.where(id: permit_params[:fillings].split(','))
    end

    def pizza_dimension
      PizzaDimension.find_by(dimension: permit_params[:pizza_dimension])
    end

    def create_custom_pizza
      current_form.validate(create_pizza_params) ? current_form.save : context.fail!
    end

    def current_form
      @current_form ||= CustomPizzas::CustomPizzaForm.new(CustomPizza.new(fillings: fillings))
    end

    def permit_params
      @permit_params ||= context.params.require(:custom_pizza).permit(:fillings, :pizza_dimension)
    end

    def create_pizza_params
      { name: :custom_pizza,
        description: :none,
        price_cents: DEFAULT_PIZZA_PRICE,
        pizza_dimension_id: pizza_dimension&.id,
        category_id: Category.find_by(name: :Custom).id }
    end
  end
end
