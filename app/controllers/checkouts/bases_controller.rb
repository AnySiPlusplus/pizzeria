# frozen_string_literal: true

module Checkouts
  class BasesController < ApplicationController
    CHECKOUT_PATH = '/checkouts/'

    before_action :check_order_not_empty!, :checking_access!, :setup_variables

    def show; end

    private

    def setup_variables
      @order_items = current_order.order_items.includes([:pizza, { pizza: :pizza_pictures }]).decorate
      @order = current_order.decorate
    end

    def check_order_not_empty!
      redirect_to(home_path) if current_order&.order_items.blank?
    end

    def checking_access!
      redirect_path(current_order.status) unless self.class::ALLOW_STATUSES.include?(current_order.status.to_sym)
    end

    def redirect_path(status)
      redirect_to("#{CHECKOUT_PATH}#{status}")
    end
  end
end
