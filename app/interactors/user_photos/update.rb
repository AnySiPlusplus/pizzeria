module UserPhotos
  class Update < BaseInteractor
    def call
      current_form.validate(permit_params) ? current_form.save : context.fail!
    end

    private

    def current_form
      @current_form ||= Users::UserPhotoForm.new(context.current_user.build_picture)
    end

    def permit_params
      context.params.require(:picture).permit(:image)
    end
  end
end
