class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::AssetTagHelper

  def format_price
    price.format
  end
end
