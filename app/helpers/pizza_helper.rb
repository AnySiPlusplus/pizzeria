module PizzaHelper
  def description_length(pizza)
    pizza.description.size > 250
  end

  def description_short(pizza)
    pizza.description.first(250)
  end

  def description_full(pizza)
    pizza.description
  end
end
