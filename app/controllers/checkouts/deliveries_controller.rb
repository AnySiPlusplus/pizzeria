# frozen_string_literal: true

module Checkouts
  class DeliveriesController < BasesController
    def show
      super
      @deliveries = Delivery.all.order(price_cents: :asc)
    end

    def update; end
  end
end
