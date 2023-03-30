# frozen_string_literal: true

module Checkouts
  class PaymentsController < BasesController
    ALLOW_STATUSES = %i[payment confirm].freeze

    before_action :setup_form
    def create
      result.success? ? success_outcome : render(:show)
    end

    def update
      asnwer = Checkouts::PayCash.call(params: params, current_order: current_order)
      asnwer.success? ? success_outcome : render(:show)
    end

    private

    def success_outcome
      flash[:notice] = I18n.t('notice.card_added')
      redirect_to checkouts_confirm_path
    end

    def setup_form
      @card_form = result.card_form
    end

    def result
      @result ||= Checkouts::CreateOrderCard.call(params: params, current_order: current_order)
    end
  end
end
