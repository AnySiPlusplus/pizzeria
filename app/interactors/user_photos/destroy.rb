module UserPhotos
  class Destroy < BaseInteractor
    def call
      delete_local_photo if Rails.env.development?
      current_image&.destroy
    end

    private

    def delete_local_photo
      UserImageUploader::IMAGE_DIMENTIONS.each do |key, _dimension|
        File.delete("public/uploads/#{current_image.image_derivatives[key].id}")
      end
      File.delete("public/uploads/#{current_image.image.id}")
    end

    def current_image
      @current_image ||= context.current_user.user_picture
    end
  end
end
