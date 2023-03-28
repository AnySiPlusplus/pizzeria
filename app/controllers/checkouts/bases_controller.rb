# frozen_string_literal: true

module Checkouts
  class BasesController < ApplicationController
    def show
      @order = current_order.decorate
    end
  end
end
