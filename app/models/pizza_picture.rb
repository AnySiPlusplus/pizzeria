class PizzaPicture < Picture
  include PizzaImageUploader::Attachment(:image)
end
