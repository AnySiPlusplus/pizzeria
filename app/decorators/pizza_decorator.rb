class PizzaDecorator < ApplicationDecorator
  SHORT_DESCRIPTION = 100
  delegate_all

  decorates_association :fillings

  def filling_full_names
    fillings.map(&:name).join(', ')
  end

  def short_description
    object.description.truncate(SHORT_DESCRIPTION)
  end

  def first_image(size)
    pizza_pictures.any? ? pizza_pictures.first.image_url(size) : PizzaPicture.new.image_url(size)
  end
end
