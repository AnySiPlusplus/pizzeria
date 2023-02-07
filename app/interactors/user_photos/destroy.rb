module UserPhotos
  class Destroy < BaseInteractor
    def call
      current_image&.destroy
    end

    def current_image
      context.current_user.picture
    end
  end
end
