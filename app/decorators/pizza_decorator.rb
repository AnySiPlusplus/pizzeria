class PizzaDecorator < ApplicationDecorator
  SHORT_DESCRIPTION = 100
  delegate_all

  def short_description
    object.description.truncate(SHORT_DESCRIPTION)
  end

  def pizza_dimension
    object.pizza_dimension.dimension
  end

  def first_image(size)
    pizza_pictures.any? ? pizza_pictures.first.image_url(size) : PizzaPicture.new.image_url(size)
  end
end
