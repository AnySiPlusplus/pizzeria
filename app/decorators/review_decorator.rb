class ReviewDecorator < ApplicationDecorator
  delegate_all
  decorates_association :billing
  decorates_association :shipping

  def user_avatar
    user.email[0].capitalize
  end

  def user_name
    object.user.billing&.decorate&.full_name || object.user.shipping&.decorate&.full_name || object.user.email
  end

  def review_create_at
    created_at.strftime(I18n.t('pizzas.review_date_format'))
  end
end
