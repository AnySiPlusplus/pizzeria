class PizzasController < ApplicationController
  before_action :permit_params, only: :index

  def index
    @pagy, @pizzas = pagy(::Pizzas::PizzasQuery.new(params).call)
    @pizzas = @pizzas.where(type: 'OrdinaryPizza').includes([:pizza_pictures]).decorate

    respond_to do |format|
      format.html
      format.json { render json: { html: render_to_string(@pizzas) } }
    end
  end

  def show
    @pizza = Pizza.find(params[:id]).decorate
    @dimensions = PizzaDimension.all
    @review_form = @pizza.reviews.build if user_signed_in?
    @reviews = Review.where(pizza_id: @pizza.id, status: :approved).includes([:user]).decorate
  end

  private

  def permit_params
    @permit_params ||= params.permit(:category_id, :sort_by)
  end
end
