# frozen_string_literal: true

class FillingsController < ApplicationController
  def show
    @order_item = OrderItem.find(params[:order_item_id]).decorate
    @fillings = Pizza.find_by(name: @order_item.pizza.name).fillings
    @additional_fillings = AdditionalFilling.all
  end

  def update
    Pizzas::UpdateCustomPizza.call(params: params)
  end

  def new
    @additional_fillings = AdditionalFilling.all
    @pizza_dimensions = PizzaDimension.all
    @fillings = OrdinaryFilling.all
  end

  def create
    Pizzas::CreateCustomPizza.call(params: params, current_order: current_order)

    redirect_to cart_path
  end
end
