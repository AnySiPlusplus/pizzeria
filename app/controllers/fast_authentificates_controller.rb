# frozen_string_literal: true

class FastAuthentificatesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def create
    result = FastAuthentificates::FastCreateUser.call(params: params)
    result.success? ? sign_in_user(result) : bad_outcome(result)
  end

  private

  def authenticate_user!
    redirect_to checkouts_delivery_path if user_signed_in?
  end

  def sign_in_user(result)
    setups_order_from_user(result)
    sign_in(:user, result.user)
    result.user.send_reset_password_instructions
    redirect_to checkouts_delivery_path
  end

  def bad_outcome(result)
    @fast_registration_form = result.form
    render :show
  end

  def setups_order_from_user(result)
    current_order.update(user_id: result.user.id)
  end
end
