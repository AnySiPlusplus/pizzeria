# frozen_string_literal: true

module FillingsHelper
  def include_filling(pizza, filling)
    pizza.fillings.include?(filling)
  end
end
