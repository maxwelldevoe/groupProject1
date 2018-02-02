class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    whitelist = [:first_name, :last_name, :email, :user_name, :admin, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: whitelist)
    devise_parameter_sanitizer.permit(:account_update, keys: whitelist)
  end
end
