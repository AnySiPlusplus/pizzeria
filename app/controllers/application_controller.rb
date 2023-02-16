class ApplicationController < ActionController::Base
  include Pagy::Backend

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
end
