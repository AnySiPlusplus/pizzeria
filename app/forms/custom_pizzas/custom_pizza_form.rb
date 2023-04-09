# frozen_string_literal: true

module CustomPizzas
  class CustomPizzaForm < BaseForm
    property :name
    property :description
    property :category_id
    property :pizza_dimension_id
    property :price_cents

    validates :name, :description, :price_cents, presence: true
  end
end
