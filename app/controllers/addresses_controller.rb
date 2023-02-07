class AddressesController < ApplicationController
  def edit
    setup_forms
    render :edit
  end

  def update
    flash[:notice] = I18n.t('notice.address_saved', type: result.address_type) if result.success?
    edit
  end

  private

  def setup_forms
    @billing_form = result.billing_form
    @shipping_form = result.shipping_form
  end

  def result
    @result ||= Addresses::AddressUpdate.call(params: params, current_user: current_user)
  end
end
