class FillingDecorator < ApplicationDecorator
  delegate_all

  def name
    object.name.to_s
  end
end
