class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :current_order

  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  def page_not_found
    flash[:warning] = I18n.t('errors.warning.page_not_found')
    redirect_to home_path
  end

  def flash_message(message)
    message.each { |type, text| flash[type] = text }
  end

  def result_message(result)
    result.success? ? flash_message(self.class::MESSAGES[:success]) : flash_message(self.class::MESSAGES[:fail])
  end

  def current_order
    @current_order ||= find_or_create_current_order
  end

  def find_or_create_current_order
    result = Orders::FindOrCreate.call(id: session[:order_id], current_user:)
    session[:order_id] = result.id if result.id
    result.order
  end
end
