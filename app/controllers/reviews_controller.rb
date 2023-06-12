class ReviewsController < ApplicationController
  MESSAGES = {
    success: { notice: I18n.t('notice.thank_for_review') },
    fail: { alert: I18n.t('errors.alert.invalid_data') }
  }.freeze

  def create
    result = Reviews::ReviewsCreate.call(params:, current_user:)
    result_message(result)
    redirect_to pizza_path(params[:pizza_id])
  end
end
