class CustomPizzasController < ApplicationController
  def new
    @additional_fillings = AdditionalFilling.all
    @pizza_dimensions = PizzaDimension.all
    @fillings = OrdinaryFilling.all
  end

  def create
    Pizzas::CreateCustomPizza.call(params: params, current_order: current_order)

    redirect_to cart_path
  end

  def edit
    @order_item = OrderItem.find(params[:order_item_id]).decorate
    @pizza_dimensions = PizzaDimension.all
    @fillings = fillings
    @additional_fillings = AdditionalFilling.all
  end

  def update
    Pizzas::UpdateCustomPizza.call(params: params)
  end

  private

  def fillings
    @order_item.pizza.type.to_sym == :CustomPizza ? OrdinaryFilling.all : similar_pizza_fillings
  end

  def similar_pizza_fillings
    Pizza.find_by(name: @order_item.pizza.name).fillings
  end
end
