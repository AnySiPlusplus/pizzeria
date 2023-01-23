module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def build_resource(sign_up_params = nil)
      self.resource = User.new
      form = Users::SignUpForm.new(resource)
      return if sign_up_params.blank?

      form.validate(sign_up_params) ? form.sync : self.resource = form
      resource.remember_me! if sign_up_params[:remember_me]
    end

    def update_resource(resource, params)
      result = Privacy::PrivacyUpdate.call(params: params, resource: resource)
      self.resource = result.form unless result.success?
      result.success?
    end
  end
end
