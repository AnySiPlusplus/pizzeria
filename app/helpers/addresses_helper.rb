module AddressesHelper
  def address_form(form)
    form.type.downcase
  end

  def check_controller(current_controller, controller_name)
    return 'active' if current_controller == controller_name
  end
end
