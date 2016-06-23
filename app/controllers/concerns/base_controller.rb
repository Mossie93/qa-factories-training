class BaseController < ApplicationController
  before_action :authenticate_user

  private

  def authenticate_user
    return true if current_user.present?
    flash[:alert] = 'You must sign in'
    redirect_to new_user_session_path
  end
end
