class ApplicationController < ActionController::Base
  before_action :configure_permitted_user_params, if: :devise_controller?

  protected

  def configure_permitted_user_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :handle, :avatar, 
    :avatar_cache, :remove_avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :handle, :avatar,
    :avatar_cache, :remove_avatar])
  end
end
