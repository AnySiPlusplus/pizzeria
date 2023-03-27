# frozen_string_literal: true

class FillingsController < ApplicationController
  def show
    @order_item = OrderItem.find(params[:order_item_id]).decorate
    @fillings = Pizza.find_by(name: @order_item.pizza.name).fillings
    @additional_fillings = AdditionalFilling.all
  end

  def update
    Pizzas::CreateCustomPizza.call(params: params)
  end
end
