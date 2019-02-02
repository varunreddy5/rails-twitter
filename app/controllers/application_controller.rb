class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :avatar, :password, :password_confirmation, :current_password])
  end
end
