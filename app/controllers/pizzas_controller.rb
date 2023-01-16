class PizzasController < ApplicationController
  before_action :permit_params, only: :index

  def index
    @pagy, @pizzas = pagy(::Pizzas::PizzasQuery.new(params).call)

    respond_to do |format|
      format.html
      format.json { render json: { html: render_to_string(@pizzas) } }
    end
  end

  def show
    @pizza = Pizza.find(params[:id]).decorate
    @dimensions = PizzaDimension.all
  end

  private

  def permit_params
    @permit_params ||= params.permit(:category_id, :sort_by)
  end
end
