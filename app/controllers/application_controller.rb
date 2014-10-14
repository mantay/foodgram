class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def configure_devise_permitted_parameters
    registration_params = [:username, :email, :password, :password_confirmation]
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  def after_sign_in_path_for(resources)
    current_user
  end

  def after_sign_up_path_for(resources)
    current_user
  end

  # devise_parameter_sanitizer.for(:sign_up) << :username
  # devise_parameter_sanitizer.for(:account_update) << :username

end
