class UserPhotosController < ApplicationController
  expose :user_photo, build_params: :user_photo_params
  expose :bird

  def create
    user_photo.user = current_user
    if user_photo.save
      redirect_to new_bird_user_photo_path(bird)
    else
      redirect_to bird_path(bird)
    end
  end

  def destroy
    user_photo.destroy
    redirect_to bird_path(bird)
  end

  private

  def user_photo_params
    params.require(:user_photo).permit(:id, :user_id, :bird_id, :attachment)
  end
end
