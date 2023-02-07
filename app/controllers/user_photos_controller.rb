class UserPhotosController < ApplicationController
  def edit
    @picture = Picture.new
  end

  def update
    UserPhotos::Update.call(params: params, current_user: current_user)

    redirect_to edit_user_photo_path
  end

  def destroy
    UserPhotos::Destroy.call(current_user: current_user)

    redirect_to edit_user_photo_path
  end
end
